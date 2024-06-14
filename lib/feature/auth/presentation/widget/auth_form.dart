import 'package:flutter/material.dart';
import 'package:rus_bal_dict/feature/auth/domain/bloc/auth_state.dart';

import '../../domain/validator/validator.dart';

class AuthForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final AuthPageState pageState;
  final bool isPasswordMasked;
  final void Function() onChangePasswordVisibility;

  const AuthForm(
      {super.key,
      required this.formKey,
      required this.onChangePasswordVisibility,
      required this.pageState,
      required this.isPasswordMasked,
      required this.nameController,
      required this.emailController,
      required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        child: Column(
          children: [
            if (pageState == AuthPageState.signUp)
              TextFormField(
                controller: nameController,
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
              controller: emailController,
              style: Theme.of(context).textTheme.bodyMedium,
              validator: AuthValidator.validateEmail,
              decoration: const InputDecoration(
                  labelText: 'Почта',
                  hintText: 'ivanov@mail.ru',
                  border: OutlineInputBorder(),
                  errorMaxLines: 3),
              maxLines: 1,
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: passwordController,
              style: Theme.of(context).textTheme.bodyMedium,
              validator: AuthValidator.validatePassword,
              decoration: InputDecoration(
                  labelText: 'Пароль',
                  hintText: 'Ivanov123',
                  errorMaxLines: 3,
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                      onPressed: onChangePasswordVisibility,
                      icon: Icon(isPasswordMasked ? Icons.visibility_off : Icons.visibility))),
              maxLines: 1,
              obscureText: isPasswordMasked,
            ),
          ],
        ));
  }
}
