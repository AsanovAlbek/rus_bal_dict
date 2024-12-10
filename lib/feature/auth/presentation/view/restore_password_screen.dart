import 'package:rus_bal_dict/core/utils/app_utils.dart';
import 'package:rus_bal_dict/export.dart';
import 'package:rus_bal_dict/feature/auth/domain/bloc/auth_bloc.dart';
import 'package:rus_bal_dict/feature/auth/domain/bloc/auth_event.dart';
import 'package:rus_bal_dict/feature/auth/domain/bloc/auth_state.dart';
import 'package:rus_bal_dict/feature/auth/domain/validator/validator.dart';
import 'package:talker/talker.dart';

class RestorePasswordScreen extends StatefulWidget {
  const RestorePasswordScreen({super.key});

  @override
  State<RestorePasswordScreen> createState() => _RestorePasswordScreenState();
}

class _RestorePasswordScreenState extends State<RestorePasswordScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.bodyMedium ?? const TextStyle();
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                  key: formKey,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Введите почту',
                      border: OutlineInputBorder(),
                    ),
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: AuthValidator.validateEmail,
                  )),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState?.validate() ?? false) {
                    Talker().debug('on press timer button');
                    context.read<AuthBloc>().add(SendCodeToEmailAuthEvent(
                        email: emailController.text.trim(),
                        onSuccess: (code) {
                          Talker().debug('code $code');
                          context.go('/auth/restore_password/input_code');
                        },
                        onError: (errorMessage) {
                          context.showSnackBar(
                              errorMessage ?? 'Ошибка при отправлении кода');
                        }));
                  }
                },
                child: const Text('Отправить код'),
              ),
              Text(
                'Мы отправим код для восстановления пароля на вашу почту. Если код не пришёл, повторите отправку',
                style: textStyle.copyWith(fontSize: 11),
              )
            ],
          ),
        ),
      );
    });
  }
}
