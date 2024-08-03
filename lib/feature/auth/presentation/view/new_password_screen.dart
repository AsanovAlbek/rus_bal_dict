import 'package:rus_bal_dict/core/utils/app_utils.dart';
import 'package:rus_bal_dict/export.dart';
import 'package:rus_bal_dict/feature/auth/domain/bloc/auth_bloc.dart';
import 'package:rus_bal_dict/feature/auth/domain/bloc/auth_event.dart';
import 'package:rus_bal_dict/feature/auth/domain/bloc/auth_state.dart';
import 'package:rus_bal_dict/feature/auth/domain/validator/validator.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<StatefulWidget> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPasswordScreen> {
  final formKey = GlobalKey<FormState>();
  final newPasswordController = TextEditingController();
  final repeatPasswordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    newPasswordController.dispose();
    repeatPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
        return Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        validator: AuthValidator.validatePassword,
                        controller: newPasswordController,
                        decoration: const InputDecoration(
                          labelText: 'Новый пароль',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 8,),
                      TextFormField(
                        validator: (confirmPassword) {
                          return AuthValidator.validatePassword(
                                  confirmPassword) ??
                              (newPasswordController.text.trim() ==
                                      repeatPasswordController.text.trim()
                                  ? null
                                  : 'Пароли не совпадают');
                        },
                        controller: repeatPasswordController,
                        decoration: const InputDecoration(
                          labelText: 'Повторите пароль',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 8,),
                      ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState?.validate() ?? false) {
                              context.read<AuthBloc>().add(
                                  UpdateUserPasswordAuthEvent(
                                      newPassword:
                                          newPasswordController.text.trim(),
                                      confirmPassword:
                                          repeatPasswordController.text.trim(),
                                      onSuccess: () {
                                        context.showSnackBar(
                                            'Вы успешно сменили пароль');
                                        context.go('/auth');
                                      },
                                      onError: (message) {
                                        context.showSnackBar(message ??
                                            'Ошибка при восстановлении пароля');
                                      }));
                            }
                          },
                          child: const Text('Подтвердить'))
                    ],
                  )),
            ));
      }),
    );
  }
}
