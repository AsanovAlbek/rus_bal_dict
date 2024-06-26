import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:rus_bal_dict/core/utils/app_utils.dart';
import 'package:rus_bal_dict/feature/auth/domain/bloc/auth_bloc.dart';
import 'package:rus_bal_dict/feature/auth/domain/bloc/auth_event.dart';
import 'package:rus_bal_dict/feature/auth/domain/bloc/auth_state.dart';
import 'package:rus_bal_dict/feature/auth/domain/repository/auth_repository.dart';
import 'package:rus_bal_dict/feature/auth/presentation/widget/auth_form.dart';

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
    return BlocProvider(
      create: (context) => AuthBloc(GetIt.I<AuthRepository>()),
      child: BlocBuilder<AuthBloc, AuthState>(
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
                      context
                          .read<AuthBloc>()
                          .add(AuthEvent.maskPassword(isPasswordMasked: !state.isPasswordMasked));
                    },
                    pageState: state.pageState,
                    isPasswordMasked: state.isPasswordMasked,
                    nameController: _nameController,
                    emailController: _emailController,
                    passwordController: _passwordController,
                  ),
                  const SizedBox(height: 8),
                  if (state.pageState == AuthPageState.signIn) ...[
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () => _signIn(context, _formKey.currentState?.validate()),
                          child: const Text('Войти')),
                    ),
                    TextButton(
                      onPressed: () {
                        _formKey.currentState?.reset();
                        FocusManager.instance.primaryFocus?.unfocus();
                        context
                            .read<AuthBloc>()
                            .add(AuthEvent.changeAuthPage(pageState: AuthPageState.signUp));
                      },
                      child: const Text('Нет аккаунта? Зарегистрироваться'),
                    ),
                  ] else ...[
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () => _signUp(context, _formKey.currentState?.validate()),
                          child: const Text('Зарегистрироваться')),
                    ),
                    TextButton(
                      onPressed: () {
                        _formKey.currentState?.reset();
                        FocusManager.instance.primaryFocus?.unfocus();
                        context
                            .read<AuthBloc>()
                            .add(AuthEvent.changeAuthPage(pageState: AuthPageState.signIn));
                      },
                      child: const Text('Назад'),
                    ),
                  ],
                  const SizedBox(height: 8),
                ],
              ),
            ),
          );
        },
      ),
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

  void _signUp(BuildContext context, bool? isValid) {
    if (isValid ?? false) {
      context.read<AuthBloc>().add(AuthEvent.signUp(
          name: _nameController.text.trim(),
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
          onSuccess: (user, message) {
            context.showSnackBar(message);
            context.go('/word_list');
            context.read<AuthBloc>().add(AuthEvent.changeAuthPage(pageState: AuthPageState.signIn));
          },
          onError: (message) {
            if (message != null) {
              context.showSnackBar(message);
            }
          }));
    }
  }
}
