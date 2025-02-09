import 'package:flutter/material.dart';
import 'package:rus_bal_dict/core/utils/app_utils.dart';
import 'package:rus_bal_dict/export.dart';
import 'package:rus_bal_dict/feature/auth/domain/bloc/auth_bloc.dart';
import 'package:rus_bal_dict/feature/auth/domain/bloc/auth_event.dart';
import 'package:rus_bal_dict/feature/auth/presentation/widget/confirm_widget.dart';
import 'package:talker/talker.dart';

import '../../../domain/bloc/auth_state.dart';

class ActivationScreen extends StatelessWidget {
  const ActivationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            if (didPop) return;
            if (context.mounted) context.pop();
          },
          child: ConfirmWidget(
            title: 'Подтверждение',
            subTitle:
                'Мы отправили код подтверждения регистрации на вашу почту',
            confirmButtonText: 'Подтвердить',
            onSendCodeAgain: () {
              Talker().debug('Отправлен код на почту ${state.email}');
              context.read<AuthBloc>().add(SendActivationCodeEvent(
                  onSuccess: () => context.showSnackBar('Код отправлен'),
                  onError: ([message]) => context.showSnackBar(message)));
            },
            onConfirmCode: (pin) =>
                context.read<AuthBloc>().add(ConfirmUserActivationEvent(
                    code: pin ?? '',
                    onSuccess: () {
                      context.pop();
                      context
                          .showSnackBar('Вы успешно активировали свой аккаунт');
                    },
                    onError: ([message]) => context.showSnackBar('$message'))),
          ),
        );
      }),
    );
  }
}
