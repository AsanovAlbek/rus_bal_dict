import 'package:flutter/material.dart';
import 'package:rus_bal_dict/core/utils/app_utils.dart';
import 'package:rus_bal_dict/export.dart';
import 'package:rus_bal_dict/feature/auth/domain/bloc/auth_bloc.dart';
import 'package:rus_bal_dict/feature/auth/domain/bloc/auth_event.dart';
import 'package:rus_bal_dict/feature/auth/presentation/widget/confirm_widget.dart';

import '../../../domain/bloc/auth_state.dart';

class ActivationScreen extends StatelessWidget {
  const ActivationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
        return ConfirmWidget(
          title: 'Подтверждение',
          subTitle: 'Мы отправили код подтверждения регистрации на вашу почту',
          confirmButtonText: 'Подтвердить',
          onSendCodeAgain: () => context.read<AuthBloc>().add(
              SendActivationCodeEvent(
                  onSuccess: () => context.showSnackBar('Код отправлен'),
                  onError: ([message]) => context.showSnackBar(message))),
          onConfirmCode: (pin) => context.read<AuthBloc>().add(
              ConfirmUserActivationEvent(
                  code: pin ?? '',
                  onSuccess: () => _signUp(context, state),
                  onError: ([message]) => context.showSnackBar('$message'))),
        );
      }),
    );
  }

  void _signUp(BuildContext context, AuthState state) {
    context.read<AuthBloc>().add(SignUpEvent(
          name: state.userName ?? '',
          email: state.email ?? '',
          password: state.password ?? '',
          onSuccess: (message) {
            context.showSnackBar(message);
            context.read<AuthBloc>().add(ChangeAuthPageEvent(pageState: AuthPageState.signIn));
            context.go('/auth');
          },
          onError: (message) {
            context.showSnackBar(message ?? 'Ошибка');
          }
    ));
  }
}
