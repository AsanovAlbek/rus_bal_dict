import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rus_bal_dict/feature/auth/domain/bloc/auth_bloc.dart';
import 'package:rus_bal_dict/feature/auth/domain/bloc/auth_state.dart';

import '../../domain/bloc/auth_event.dart';

class SignInWidget extends StatelessWidget {
  const SignInWidget(
      {super.key,
      required this.authFormKey,
      this.onSignIn});
  final GlobalKey<FormState> authFormKey;
  final Function(BuildContext context, bool? isValid)? onSignIn;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () =>
                  onSignIn?.call(context, authFormKey.currentState?.validate()),
              child: const Text('Войти')),
        ),
        TextButton(
          onPressed: () {
            authFormKey.currentState?.reset();
            FocusManager.instance.primaryFocus?.unfocus();
            context
                .read<AuthBloc>()
                .add(AuthEvent.changeAuthPage(pageState: AuthPageState.signUp));
          },
          child: const Text('Нет аккаунта? Зарегистрироваться'),
        ),
        TextButton(
          onPressed: () {
            authFormKey.currentState?.reset();
            FocusManager.instance.primaryFocus?.unfocus();
            context.go('/auth/restore_password');
          },
          child: const Text('Забыли пароль?'),
        )
      ],
    );
  }
}
