import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:rus_bal_dict/core/constants/strings.dart';
import 'package:rus_bal_dict/core/utils/app_utils.dart';
import 'package:rus_bal_dict/core/widgets/my_app_bar.dart';
import 'package:rus_bal_dict/export.dart';
import 'package:rus_bal_dict/feature/auth/domain/bloc/auth_bloc.dart';
import 'package:rus_bal_dict/feature/auth/domain/bloc/auth_event.dart';
import 'package:rus_bal_dict/feature/auth/domain/bloc/auth_state.dart';
import 'package:rus_bal_dict/feature/auth/domain/validator/validator.dart';

class PolicyAgreeScreen extends StatelessWidget {
  const PolicyAgreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
        return CustomScrollView(slivers: [
          const MyAppBar(title: 'Политика конфиденциальности'),
          SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              'Внимательно ознакомьтесь с данным текстом, прежде чем начать пользоваться приложением',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          )),
          const SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Card(
                margin: EdgeInsets.all(8),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: HtmlWidget(AppStrings.politics),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CheckboxListTile.adaptive(
                  title: const Text(
                      'Я ознакомлен и согласен с политикой конфиденциальности'),
                  value: state.policyAgree,
                  onChanged: (agree) {
                    context
                        .read<AuthBloc>()
                        .add(AuthEvent.changeAgree(agree: agree));
                  }),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () => _signUp(context, state),
                  child: const Text('Зарегистрироваться')),
            ),
          )
        ]);
      }),
    );
  }

  void _signUp(BuildContext context, AuthState state) {
    context.read<AuthBloc>().add(AuthEvent.signUp(
        name: state.userName,
        email: state.email,
        password: state.password,
        onSuccess: (user, message) {
          context.showSnackBar(message);
          context.go('/word_list');
          context
              .read<AuthBloc>()
              .add(AuthEvent.changeAuthPage(pageState: AuthPageState.signIn));
          context.read<ProfileCubit>().fetchUserPaymentInfo();
        },
        onError: (message) {
          if (message != null) {
            context.showSnackBar(message);
          }
        },
        onUserNoAgreeWithPolicy: () {
          context.showSnackBar(
              'Вы не согласились с политикой конфиденциальности.');
        }));
  }
}
