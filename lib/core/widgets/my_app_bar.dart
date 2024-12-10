import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:rus_bal_dict/core/model/settings/converter.dart';

import '../../colors.dart';
import '../hive/settings/app_settings_hive.dart';
import '../model/settings/theme_mode.dart';

class MyAppBar extends StatelessWidget {
  final String title;
  final TextEditingController? searchController;
  final Function(String?)? onTextEditing;
  final bool showSearchField;
  final List<Widget>? actions;

  const MyAppBar(
      {super.key,
      required this.title,
      this.searchController,
      this.onTextEditing,
      this.actions,
      this.showSearchField = false});

  @override
  Widget build(BuildContext context) {
    List<Color> appBarGradient(SettingsThemeMode appThemeMode) {
      final darkGradientColors = [
        AppDarkColors.gradientStartColor,
        AppDarkColors.gradientEndColor
      ];
      final lightGradientColors = [
        AppLightColors.gradientStartColor,
        AppLightColors.gradientEndColor
      ];
      return switch (appThemeMode) {
        SettingsThemeMode.light => lightGradientColors,
        SettingsThemeMode.dark => darkGradientColors,
        SettingsThemeMode.system =>
          MediaQuery.of(context).platformBrightness == Brightness.light
              ? lightGradientColors
              : darkGradientColors
      };
    }

    return ValueListenableBuilder(
      valueListenable: Hive.box<AppSettingsHiveModel>('settings').listenable(),
      builder: (BuildContext context, Box<AppSettingsHiveModel> value,
          Widget? child) {
        final themeMode = value.getAt(0)!.toModel().settings.themeMode;
        return SliverAppBar(
          pinned: true,
          expandedHeight: showSearchField ? 150 : null,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: appBarGradient(themeMode))),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              if (context.canPop()) {
                context.pop();
                return;
              }
              showDialog(
                  context: context,
                  builder: (dialogContext) {
                    final textStyle = Theme.of(context).textTheme.bodyMedium;
                    return AlertDialog(
                      title: Text('Вы точно хотите выйти из приложения?',
                          style: textStyle),
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                                onPressed: () => exit(0),
                                child: const Text('Да')),
                            TextButton(
                                onPressed: () => dialogContext.pop(),
                                child: const Text('Нет')),
                          ],
                        )
                      ],
                    );
                  });
            },
          ),
          title: FittedBox(
              child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w700),
          )),
          bottom: showSearchField
              ? PreferredSize(
                  preferredSize: const Size.fromHeight(50),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextField(
                      style: const TextStyle(color: Colors.black),
                      controller: searchController,
                      decoration: const InputDecoration(
                          filled: true,
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.search),
                          //labelText: 'Поиск слова',
                          hintStyle: TextStyle(color: Colors.black),
                          hintText: 'Поиск слова...'),
                      onChanged: onTextEditing,
                    ),
                  ),
                )
              : null,
          actions: actions,
        );
      },
    );
  }
}
