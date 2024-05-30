import 'dart:io';

import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rus_bal_dict/core/di/core_module.dart';
import 'package:rus_bal_dict/core/hive/settings/app_settings_hive.dart';
import 'package:rus_bal_dict/core/model/settings/converter.dart';
import 'package:rus_bal_dict/feature/profile/di/profile_module.dart';
import 'package:rus_bal_dict/feature/profile/domain/cubit/profile_cubit.dart';
import 'package:rus_bal_dict/feature/profile/domain/repository/profile_repository.dart';
import 'package:rus_bal_dict/feature/word_detail/di/detail_module.dart';
import 'package:rus_bal_dict/feature/words_list/di/word_list_module.dart';

import 'core/model/settings/theme_mode.dart';
import 'core/hive/word/word_hive_model.dart';
import 'feature/history/di/history_module.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(WordHiveModelAdapter());
  Hive.registerAdapter(AppSettingsHiveModelAdapter());
  final historyBox = await Hive.openBox<WordHiveModel>('history');
  final favoritesBox = await Hive.openBox<WordHiveModel>('favorites');
  final settingsBox = await Hive.openBox<AppSettingsHiveModel>('settings');
  final tempDir = await getTemporaryDirectory();
  coreModule(HiveCacheStore(tempDir.path));
  wordListModule();
  detailModule();
  historyModule(historyBox);
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
              title: 'Русско - Балкарский словарь',
              theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(
                      seedColor: Colors.deepPurple,
                      brightness: _brightness(context, appSettings.settings.themeMode)),
                  useMaterial3: true),
              routerConfig: router,
              debugShowCheckedModeBanner: false,
            );
          },
        ),
      ),
    );
  }

  Brightness _brightness(BuildContext context, SettingsThemeMode themeMode) {
    return switch (themeMode) {
      SettingsThemeMode.system => MediaQuery.of(context).platformBrightness,
      SettingsThemeMode.light => Brightness.light,
      SettingsThemeMode.dark => Brightness.dark,
    };
  }
}
