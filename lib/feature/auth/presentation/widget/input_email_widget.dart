import 'package:flutter/material.dart';

import '../../domain/validator/validator.dart';

class InputEmailWidget extends StatefulWidget {
  const InputEmailWidget({
    super.key,
    this.title = "Title",
    this.subTitle = "SubTitle",
    this.onSendMessageToEmail,
    this.sendButtonText = "Send",
  });

  final String title;
  final String subTitle;
  final Function(String)? onSendMessageToEmail;
  final String sendButtonText;

  @override
  State<InputEmailWidget> createState() => _InputEmailWidgetState();
}

class _InputEmailWidgetState extends State<InputEmailWidget> {
  final formKey = GlobalKey<FormState>();
  late final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(widget.title, style: textTheme.headlineSmall),
        const SizedBox(
          height: 16,
        ),
        Text(
          widget.subTitle,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 16,
        ),
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
          onPressed: () =>
              widget.onSendMessageToEmail?.call(emailController.text.trim()),
          child: Text(widget.sendButtonText),
        ),
        Text(
          'Мы отправим код для восстановления пароля на вашу почту. Если код не пришёл, повторите отправку',
          style: textTheme.bodyMedium?.copyWith(fontSize: 11),
        )
      ],
    );
  }
}
