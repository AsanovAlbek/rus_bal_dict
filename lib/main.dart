import 'dart:io';

import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rus_bal_dict/core/di/core_module.dart';
import 'package:rus_bal_dict/core/hive/favorite_word/favorite_word_hive_model.dart';
import 'package:rus_bal_dict/core/hive/settings/app_settings_hive.dart';
import 'package:rus_bal_dict/core/model/settings/converter.dart';
import 'package:rus_bal_dict/feature/auth/di/auth_module.dart';
import 'package:rus_bal_dict/feature/favorites/di/favorite_module.dart';
import 'package:rus_bal_dict/feature/profile/di/profile_module.dart';
import 'package:rus_bal_dict/feature/profile/domain/cubit/profile_cubit.dart';
import 'package:rus_bal_dict/feature/profile/domain/repository/profile_repository.dart';
import 'package:rus_bal_dict/feature/word_detail/di/detail_module.dart';
import 'package:rus_bal_dict/feature/words_list/di/word_list_module.dart';
import 'package:rus_bal_dict/themes.dart';

import 'core/model/settings/theme_mode.dart';
import 'core/hive/word/word_hive_model.dart';
import 'feature/history/di/history_module.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(WordHiveModelAdapter());
  Hive.registerAdapter(AppSettingsHiveModelAdapter());
  Hive.registerAdapter(FavoriteWordHiveModelAdapter());
  final historyBox = await Hive.openBox<WordHiveModel>('history');
  final favoritesBox = await Hive.openBox<FavoriteWordHiveModel>('favorites');
  final settingsBox = await Hive.openBox<AppSettingsHiveModel>('settings');
  final tempDir = await getTemporaryDirectory();
  coreModule(HiveCacheStore(tempDir.path));
  authModule(settingsBox);
  wordListModule();
  favoriteModule(settingsBox, favoritesBox);
  detailModule();
  historyModule(settingsBox, historyBox);
  profileModule(settingsBox);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final router = GetIt.I<GoRouter>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => ProfileCubit(GetIt.I<ProfileRepository>()),
        child: ValueListenableBuilder(
          valueListenable: Hive.box<AppSettingsHiveModel>('settings').listenable(),
          builder: (context, box, child) {
            if (box.isEmpty) {
              box.put('AppSettings', AppSettingsHiveModel());
            }
            final appSettings = box.get('AppSettings', defaultValue: AppSettingsHiveModel())!.toModel();
            context.read<ProfileCubit>().settings(appSettings);
            return MaterialApp.router(
              builder: (context, child) {
                return MediaQuery(data: MediaQuery.of(context).copyWith(
                  textScaler: TextScaler.linear(appSettings.settings.fontSize)
                ), child: child!);
              },
              title: 'Русско - Балкарский словарь',
              theme: _themeData(context, appSettings.settings.themeMode),
              routerConfig: router,
              debugShowCheckedModeBanner: false,
            );
          },
        ),
      ),
    );
  }

  ThemeData _themeData(BuildContext context, SettingsThemeMode themeMode) {
    return switch (themeMode) {
      SettingsThemeMode.system => MediaQuery.of(context).platformBrightness == Brightness.light ? lightTheme : darkTheme,
      SettingsThemeMode.light => lightTheme,
      SettingsThemeMode.dark => darkTheme,
    };
  }

  // Brightness _brightness(BuildContext context, SettingsThemeMode themeMode) {
  //   return switch (themeMode) {
  //     SettingsThemeMode.system => MediaQuery.of(context).platformBrightness,
  //     SettingsThemeMode.light => Brightness.light,
  //     SettingsThemeMode.dark => Brightness.dark,
  //   };
  // }
}
