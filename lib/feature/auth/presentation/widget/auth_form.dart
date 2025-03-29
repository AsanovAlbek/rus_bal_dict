import 'package:flutter/material.dart';
import 'package:rus_bal_dict/core/model/login_data/login_data.dart';
import 'package:rus_bal_dict/feature/auth/domain/bloc/auth_state.dart';

import '../../domain/validator/validator.dart';

class AuthForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final AuthPageState pageState;
  final bool isPasswordMasked;
  final LoginData loginData;
  final void Function() onChangePasswordVisibility;
  final void Function(bool? remember) onChangeRememberMe;

  const AuthForm(
      {super.key,
      required this.formKey,
      required this.onChangePasswordVisibility,
      required this.onChangeRememberMe,
      required this.pageState,
      required this.isPasswordMasked,
      required this.loginData,
      required this.nameController,
      required this.emailController,
      required this.passwordController});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  @override
  void initState() {
    if (mounted) {
      if (widget.loginData.rememberMe) {
        widget.emailController.text = widget.loginData.email;
        widget.passwordController.text = widget.loginData.password;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: widget.formKey,
        child: Column(
          children: [
            if (widget.pageState == AuthPageState.signUp)
              TextFormField(
                controller: widget.nameController,
                style: Theme.of(context).textTheme.bodyMedium,
                validator: AuthValidator.validateUserName,
                decoration: const InputDecoration(
                    errorMaxLines: 3,
                    labelText: 'Имя пользователя',
                    hintText: 'Иван Иванов',
                    border: OutlineInputBorder()),
                maxLines: 1,
              ),
            const SizedBox(height: 8),
            TextFormField(
              controller: widget.emailController,
              style: Theme.of(context).textTheme.bodyMedium,
              validator: AuthValidator.validateEmail,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  labelText: 'Почта',
                  hintText: 'ivanov@mail.ru',
                  border: OutlineInputBorder(),
                  errorMaxLines: 3),
              maxLines: 1,
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: widget.passwordController,
              style: Theme.of(context).textTheme.bodyMedium,
              validator: AuthValidator.validatePassword,
              decoration: InputDecoration(
                  labelText: 'Пароль',
                  hintText: 'Ivanov123',
                  errorMaxLines: 3,
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                      onPressed: widget.onChangePasswordVisibility,
                      icon: Icon(widget.isPasswordMasked
                          ? Icons.visibility_off
                          : Icons.visibility))),
              maxLines: 1,
              obscureText: widget.isPasswordMasked,
            ),
            CheckboxListTile(
                value: widget.loginData.rememberMe,
                onChanged: widget.onChangeRememberMe),
          ],
        ));
  }
}
