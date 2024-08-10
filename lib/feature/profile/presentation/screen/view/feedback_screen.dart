import 'package:flutter/material.dart';
import 'package:rus_bal_dict/core/widgets/my_app_bar.dart';
import 'package:rus_bal_dict/feature/profile/presentation/screen/widget/feedback_item.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      const MyAppBar(title: 'О приложении'),
      SliverList.list(children: const [
        FeedbackItem(
          title: 'КБНЦ РАН',
          subtitle: 'Компания - разработчик',
          email: 'kbnc_ran@mail.ru',
          contactPhoneNumber: '+7-777-777-77-77',
        ),
        FeedbackItem(
          title: 'КБНЦ РАН',
          subtitle: 'Компания - разработчик',
          email: 'kbnc_ran@mail.ru',
          contactPhoneNumber: '+7-777-777-77-77',
        ),
        FeedbackItem(
          title: 'КБНЦ РАН',
          subtitle: 'Компания - разработчик',
          email: 'kbnc_ran@mail.ru',
          contactPhoneNumber: '+7-777-777-77-77',
        ),
      ])
    ]);
  }
}
