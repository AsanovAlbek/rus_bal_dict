import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rus_bal_dict/core/navigation/navigation_args.dart';
import 'package:rus_bal_dict/core/widgets/my_app_bar.dart';

class PremiumScreen extends StatelessWidget {
  const PremiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const String email = 'asaalbek@yandex.ru';
    final isPremium = Random().nextBool();
    return CustomScrollView(
      slivers: [
        const MyAppBar(title: 'Подписка'),
        SliverVisibility(
            sliver: SliverToBoxAdapter(
          child: ListTile(
            leading: const Icon(Icons.stars_sharp, size: 36),
            title: Text('Статус подписки: Подписка ${isPremium ? 'активна' : 'неактивна'}'),
            subtitle: Visibility(visible: isPremium, child: const Text('Конец через n дней')),
            iconColor: Colors.green[600],
            textColor: theme.textTheme.bodyMedium?.color,
            subtitleTextStyle:
                theme.textTheme.bodySmall?.copyWith(fontSize: 11),
          ),
        )),
        SliverList.list(children: const [
          PremiumPlan(
              amount: '300',
              email: email,
              title: 'Преобрести подписку на месяц'),
          PremiumPlan(
              amount: '1500',
              email: email,
              title: 'Преобрести подписку на пол года'),
          PremiumPlan(
              amount: '2400',
              email: email,
              title: 'Преобрести подписку на год'),
        ])
      ],
    );
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
