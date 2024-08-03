import 'package:pinput/pinput.dart';
import 'package:rus_bal_dict/core/utils/app_utils.dart';
import 'package:rus_bal_dict/export.dart';
import 'package:rus_bal_dict/feature/auth/domain/bloc/auth_bloc.dart';
import 'package:rus_bal_dict/feature/auth/domain/bloc/auth_event.dart';
import 'package:rus_bal_dict/feature/auth/domain/bloc/auth_state.dart';
import 'package:rus_bal_dict/feature/auth/domain/validator/validator.dart';
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
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Введите код, который пришёл к вам на почту', textAlign: TextAlign.center,),
              const SizedBox(height: 8,),
              Form(
                key: formKey,
                child: Pinput(
                  length: 6,
                  validator: AuthValidator.validateRestorePasswordCode,
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: true,
                  onCompleted: (pin) {
                    if (state.codeFromEmail != null && state.codeFromEmail == int.parse(pin)) {
                      context.go('/auth/restore_password/input_code/new_password');
                    } else {
                      context.showSnackBar('Неверный код');
                    }
                  },
                ),
              ),
              const SizedBox(height: 8,),
              const Text('Не пришел код?'),
              const SizedBox(height: 8,),
              TimerButton(
                  buttonText: 'Отправить код повторно',
                  buttonStyle: ButtonStyle(foregroundColor: WidgetStatePropertyAll(Colors.deepPurple[400])),
                  buttonOnTimerRunText: 'Отправить код повторно через ',
                  onPressed: () {
                    Talker().debug('on press timer button');
                    context.read<AuthBloc>().add(SendCodeToEmailAuthEvent(
                        email: state.emailForRestorePassword ?? '',
                        onSuccess: (code) {
                          Talker().debug('code $code');
                        },
                        onError: (errorMessage) {
                          context.showSnackBar(
                              errorMessage ?? 'Ошибка при отправлении кода');
                        }));
                  },
                  onTimerEnd: () {
                    Talker().debug('on end timer');
                  },
                  timerFormat: 'HH:mm:ss',
                )
            ],
          );
        }
      ),
    );
  }
}
