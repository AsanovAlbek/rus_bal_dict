import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rus_bal_dict/core/widgets/my_app_bar.dart';
import 'package:rus_bal_dict/feature/profile/domain/cubit/profile_cubit.dart';
import 'package:rus_bal_dict/feature/profile/presentation/widget/profile_item.dart';

import '../../domain/cubit/profile_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (BuildContext context, ProfileState state) {
        return CustomScrollView(
          controller: ScrollController(),
          slivers: [
            const MyAppBar(title: 'Профиль'),
            SliverList.list(children: [
              ProfileItem(
                  title: 'Настройки',
                  onPress: () => context.go('/profile/settings')),
              ProfileItem(
                title: 'Предложить слово',
                onPress: () => context.go('/profile/suggest_word'),
              ),
              ProfileItem(
                title: 'Обратная связь',
                onPress: () => context.go('/profile/feedback'),
              ),
              ProfileItem(
                title: 'Подписка',
                onPress: () async {
                  await context.read<ProfileCubit>().fetchUserPaymentInfo(() {
                    context.go('/profile/premium');
                  });
                },
              ),
              ProfileItem(
                title: 'О приложении',
                onPress: () => context.go('/profile/about_app'),
              ),
              ProfileItem(
                title: 'Условия использования',
                onPress: () => context.go('/profile/term_of_use'),
              ),
              ProfileItem(
                title: 'Политика конфиденциальности',
                onPress: () => context.go('/profile/privacy'),
              ),
              ProfileItem(
                  title: 'Выход',
                  titleColor: Colors.red,
                  showDivider: false,
                  onPress: () {
                    context.read<ProfileCubit>().signOut();
                    context.pushReplacement('/auth');
                  }),
            ])
          ],
        );
      },
    );
  }
}
