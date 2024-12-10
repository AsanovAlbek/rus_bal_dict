import 'package:flutter/gestures.dart';
import 'package:rus_bal_dict/export.dart';
import 'package:rus_bal_dict/feature/auth/presentation/widget/sign_in_widget.dart';
import 'package:rus_bal_dict/feature/auth/presentation/widget/sign_up_widget.dart';

import '../auth.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AuthForm(
                  formKey: _formKey,
                  onChangePasswordVisibility: () {
                    context.read<AuthBloc>().add(AuthEvent.maskPassword(
                        isPasswordMasked: !state.isPasswordMasked));
                  },
                  pageState: state.pageState,
                  isPasswordMasked: state.isPasswordMasked,
                  nameController: _nameController,
                  emailController: _emailController,
                  passwordController: _passwordController,
                ),
                const SizedBox(height: 8),
                state.pageState == AuthPageState.signIn
                    ? SignInWidget(authFormKey: _formKey, onSignIn: _signIn)
                    : SignUpWidget(
                        authFormKey: _formKey,
                        onSignUp: (context, isValid) {
                          if (isValid ?? false) {
                            context.read<AuthBloc>().add(
                                AuthEvent.saveUserSignUpInput(
                                    name: _nameController.text.trim(),
                                    email: _emailController.text.trim(),
                                    password: _passwordController.text.trim(),
                                    onComplete: () =>
                                        context.go('/auth/register_agree')));
                          }
                        }),
                const SizedBox(height: 8),
              ],
            ),
          ),
        );
      },
    );
  }

  void _signIn(BuildContext context, bool? isValid) {
    if (isValid ?? false) {
      context.read<AuthBloc>().add(AuthEvent.signIn(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
          onSuccess: (user, message) {
            context.showSnackBar(message);
            context.go('/word_list');
          },
          onError: (message) {
            if (message != null) {
              context.showSnackBar(message);
            }
          }));
    }
  }
}
