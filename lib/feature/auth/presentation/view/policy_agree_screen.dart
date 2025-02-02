import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:rus_bal_dict/core/constants/strings.dart';
import 'package:rus_bal_dict/core/utils/app_utils.dart';
import 'package:rus_bal_dict/core/widgets/my_app_bar.dart';
import 'package:rus_bal_dict/export.dart';
import 'package:rus_bal_dict/feature/auth/domain/bloc/auth_bloc.dart';
import 'package:rus_bal_dict/feature/auth/domain/bloc/auth_event.dart';
import 'package:rus_bal_dict/feature/auth/domain/bloc/auth_state.dart';

class PolicyAgreeScreen extends StatelessWidget {
  const PolicyAgreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
        return CustomScrollView(slivers: [
          const MyAppBar(title: 'Подтверждение регистрации'),
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
                  child: Column(
                    children: [
                      HtmlWidget(AppStrings.politics),
                      HtmlWidget(AppStrings.termOfUse),
                    ],
                  ),
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
                        .add(ChangeAgreeWithPolicyAuthEvent(agree));
                  }),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CheckboxListTile.adaptive(
                  title: const Text(
                      'Я ознакомлен и согласен с условиями использования'),
                  value: state.termOfUseAgree,
                  onChanged: (agree) {
                    context
                        .read<AuthBloc>()
                        .add(ChangeAgreeWithTermOfUseEvent(agree));
                  }),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    if (state.policyAgree && state.termOfUseAgree) {
                      context.go('auth/register_agree/activate');
                    } else {
                      context.showSnackBar('Нужно согласиться с политикой');
                    }
                  },
                  child: const Text('Далее')),
            ),
          )
        ]);
      }),
    );
  }
}