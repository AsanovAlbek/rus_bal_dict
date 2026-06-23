import 'package:pinput/pinput.dart';
import 'package:rus_bal_dict/core/utils/app_utils.dart';
import 'package:rus_bal_dict/export.dart';
import 'package:rus_bal_dict/feature/auth/domain/bloc/auth_bloc.dart';
import 'package:rus_bal_dict/feature/auth/domain/bloc/auth_event.dart';
import 'package:rus_bal_dict/feature/auth/domain/bloc/auth_state.dart';
import 'package:rus_bal_dict/feature/auth/domain/validator/validator.dart';
import 'package:rus_bal_dict/feature/auth/presentation/widget/confirm_widget.dart';
import 'package:rus_bal_dict/feature/auth/presentation/widget/timer_button.dart';
import 'package:talker/talker.dart';

class InputCodeScreen extends StatefulWidget {
  const InputCodeScreen({super.key});

  @override
  State<InputCodeScreen> createState() => _InputCodeScreenState();
}

class _InputCodeScreenState extends State<InputCodeScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            if (didPop) return;
            if (mounted && context.canPop()) context.pop();
          },
          child: ConfirmWidget(
            title: 'Подтверждение',
            subTitle: 'Мы отправили на вашу почту код для восстановления пароля',
            confirmButtonText: 'Подтвердить',
            onSendCodeAgain: () {
              context.read<AuthBloc>().add(SendRestoreCodeEvent(
                  email: state.emailForRestorePassword ?? '',
                  onSuccess: () => context.showSnackBar('Код отправлен'),
                  onError: ([message]) =>
                      context.showSnackBar(message ?? 'Ошибка')));
            },
            onConfirmCode: (pin) {
              context.read<AuthBloc>().add(ConfirmRestoreCodeEvent(
                  email: state.emailForRestorePassword ?? '',
                  code: pin ?? '',
                  onSuccess: () {
                    context.go('/auth/restore_password/input_code/new_password');
                  },
                  onError: ([errorMessage]) =>
                      context.showSnackBar(errorMessage ?? 'Ошибка')));
            },
          ),
        );
      }),
    );
  }
}
