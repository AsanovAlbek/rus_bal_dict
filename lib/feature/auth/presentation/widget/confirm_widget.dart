import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:rus_bal_dict/feature/auth/presentation/widget/timer_button.dart';

import '../../domain/validator/validator.dart';

class ConfirmWidget extends StatefulWidget {
  const ConfirmWidget(
      {super.key,
      required this.title,
      required this.subTitle,
      this.confirmButtonText = 'Подтвердить',
      this.onSendCodeAgain,
      this.onConfirmCode,
      this.codeLength = 6});

  final String title;
  final String subTitle;
  final String confirmButtonText;
  final VoidCallback? onSendCodeAgain;
  final Function(String? code)? onConfirmCode;
  final int codeLength;

  @override
  State<ConfirmWidget> createState() => _ConfirmWidgetState();
}

class _ConfirmWidgetState extends State<ConfirmWidget> {
  final _formKey = GlobalKey<FormState>();
  bool enableConfirmButton = false;
  late final _pinController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _pinController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.title,
            textAlign: TextAlign.center,
            style: textTheme.headlineSmall,
          ),
          const SizedBox(
            height: 8,
          ),
          Form(
            key: _formKey,
            child: Pinput(
              length: widget.codeLength,
              validator: AuthValidator.validateRestorePasswordCode,
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              showCursor: true,
              onChanged: (value) => setState(() {
                enableConfirmButton = value.length == widget.codeLength;
              }),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const Text('Не пришел код?'),
          const SizedBox(
            height: 8,
          ),
          TimerButton(
              buttonText: 'Отправить код повторно',
              buttonStyle: ButtonStyle(
                  foregroundColor:
                      WidgetStatePropertyAll(Colors.deepPurple[400])),
              buttonOnTimerRunText: 'Отправить код повторно через ',
              onPressed: widget.onSendCodeAgain),
          const SizedBox(
            height: 8,
          ),
          ElevatedButton(
              onPressed: enableConfirmButton
                  ? () => widget.onConfirmCode?.call(_pinController.text.trim())
                  : null,
              child: Text(widget.confirmButtonText))
        ],
      ),
    );
  }
}
