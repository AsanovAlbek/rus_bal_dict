import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rus_bal_dict/core/utils/app_utils.dart';
import 'package:rus_bal_dict/core/widgets/my_app_bar.dart';

import '../../../../core/model/settings/theme_mode.dart';
import '../../domain/cubit/profile_cubit.dart';
import '../../domain/cubit/profile_state.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (BuildContext context, ProfileState state) {
        return CustomScrollView(
          slivers: [
            const MyAppBar(title: 'Настройки'),
            const Text('Тема приложения', textAlign: TextAlign.center).asSliver,
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
            SliverPadding(
              padding: const EdgeInsets.all(8.0),
              sliver: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(child: Text('Размер текста: ${state.appSettings.settings.fontSize.toStringAsFixed(2)}')),
                  Flexible(
                    child: TextButton(
                        onPressed: () {
                          context.read<ProfileCubit>().changeTextScale(1.0);
                        },
                        child: const Text('По умолчанию')),
                  )
                ],
              ).asSliver,
            ),
            const SizedBox(height: 4).asSliver,
            Center(
              child: Slider(
                value: state.appSettings.settings.fontSize,
                min: 0.8,
                max: 1.5,
                label: '${state.appSettings.settings.fontSize}',
                onChanged: (sliderValue) {
                  context.read<ProfileCubit>().changeTextScale(sliderValue);
                },
              ),
            ).asSliver
          ],
        );
      },
    );
  }
}
