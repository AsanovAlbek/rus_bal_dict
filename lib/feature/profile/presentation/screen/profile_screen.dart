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
              ProfileItem(title: 'Настройки', onPress: () => context.go('/profile/settings')),
              const ProfileItem(title: 'Предложить слово'),
              const ProfileItem(title: 'Обратная связь'),
              const ProfileItem(title: 'О приложении'),
              const ProfileItem(title: 'Условия использования'),
              ProfileItem(
                  title: 'Выход',
                  titleColor: Colors.red,
                  showDivider: false,
                  onPress: () {
                    context.read<ProfileCubit>().signOut();
                    context.pushReplacement('/');
                  })
            ])
          ],
        );
      },
    );
  }
}
