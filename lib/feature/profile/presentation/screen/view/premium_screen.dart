import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rus_bal_dict/core/navigation/navigation_args.dart';
import 'package:rus_bal_dict/core/widgets/my_app_bar.dart';
import 'package:rus_bal_dict/feature/profile/domain/cubit/profile_state.dart';

import '../../../domain/cubit/profile_cubit.dart';

class PremiumScreen extends StatelessWidget {
  const PremiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
      final userEmail = state.appSettings.userInfo.email ?? '';
      final premiumInfoText = state.paymentInfo.isSubscribe
          ? 'Конец через ${state.paymentInfo.dayLimit} дней'
          : 'Количество попыток на сегодня: ${state.paymentInfo.dayLimit}';
      return CustomScrollView(
        slivers: [
          const MyAppBar(title: 'Подписка'),
          SliverVisibility(
              sliver: SliverToBoxAdapter(
            child: ListTile(
              leading: const Icon(Icons.stars_sharp, size: 36),
              title: Text(
                  'Статус подписки: Подписка ${state.paymentInfo.isSubscribe ? 'активна' : 'неактивна'}'),
              subtitle: Text(premiumInfoText),
              iconColor: state.paymentInfo.isSubscribe ? Colors.green[600] : Colors.teal[200],
              textColor: theme.textTheme.bodyMedium?.color,
              subtitleTextStyle:
                  theme.textTheme.bodySmall?.copyWith(fontSize: 11),
            ),
          )),
          SliverVisibility(
            visible: !state.paymentInfo.isSubscribe,
            sliver: SliverList.list(children: [
              PremiumPlan(
                  amount: '300',
                  email: userEmail,
                  title: 'Преобрести подписку на месяц'),
              PremiumPlan(
                  amount: '1500',
                  email: userEmail,
                  title: 'Преобрести подписку на пол года'),
              PremiumPlan(
                  amount: '2400',
                  email: userEmail,
                  title: 'Преобрести подписку на год'),
            ]),
          )
        ],
      );
    });
  }
}

class PremiumPlan extends StatelessWidget {
  final String amount;
  final String email;
  final String title;
  const PremiumPlan(
      {super.key,
      required this.amount,
      required this.email,
      required this.title});

  void _redirectToPay(
      {required GoRouter router,
      required String amount,
      required String email,
      String? websiteUrl}) {
    if (kIsWeb) {
      assert(websiteUrl != null,
          'Для веб версии обязательно нужно указать url сайта');
      // TODO: Веб версия, надо перенаправить на сайт
    } else {
      // Перенаправляем на экран с webview
      router.go('/profile/premium/payment',
          extra: PaymentArg(amount: amount, email: email));
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        title: Text(title),
        subtitle: Text('$amount руб'),
        textColor: Theme.of(context).textTheme.bodyMedium?.color,
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: theme.colorScheme.onPrimary,
        ),
        onTap: () => _redirectToPay(
            router: GoRouter.of(context), amount: amount, email: email),
      ),
    );
  }
}
