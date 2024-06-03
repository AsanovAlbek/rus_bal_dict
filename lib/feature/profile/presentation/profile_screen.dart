import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:rus_bal_dict/core/model/settings/theme_mode.dart';
import 'package:rus_bal_dict/core/utils/app_utils.dart';
import 'package:rus_bal_dict/feature/profile/domain/cubit/profile_cubit.dart';
import 'package:rus_bal_dict/feature/profile/domain/repository/profile_repository.dart';

import '../domain/cubit/profile_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (BuildContext context, ProfileState state) {
        return CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 150,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(state.appSettings.userInfo.name ?? 'Имя пользователя'),
                background: const FlutterLogo(),
              ),
            ),
            const Divider().asSliver,
            const Text('Тема приложения').asSliver,
            const SizedBox(height: 4).asSliver,
            Center(
              child: SegmentedButton<SettingsThemeMode>(
                  multiSelectionEnabled: false,
                  emptySelectionAllowed: false,
                  showSelectedIcon: false,
                  selected: state.selectThemeTogglesSelection,
                  onSelectionChanged: context.read<ProfileCubit>().selectTheme,
                  segments: SettingsThemeMode.values.map((mode) {
                    return ButtonSegment(value: mode, label: Text(mode.label));
                  }).toList()),
            ).asSliver,
            const Divider().asSliver,
            TextButton(
                    onPressed: () {
                      context.read<ProfileCubit>().signOut();
                      context.pushReplacement('/');
                    },
                    child: const Text('Выход'))
                .asSliver
          ],
        );
      },
    );
  }
}
