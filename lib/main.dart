import 'package:flutter/foundation.dart';
import 'package:rus_bal_dict/core/constants/config.dart';
import 'package:rus_bal_dict/feature/auth/domain/bloc/auth_bloc.dart';
import 'package:rus_bal_dict/feature/auth/domain/repository/auth_repository.dart';

import 'export.dart';
import 'feature/auth/di/auth_module.dart';
import 'feature/favorites/di/favorite_module.dart';
import 'feature/history/di/history_module.dart';
import 'feature/profile/di/profile_module.dart';
import 'feature/word_detail/di/detail_module.dart';
import 'feature/words_list/di/word_list_module.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(WordHiveModelAdapter());
  Hive.registerAdapter(AppSettingsHiveModelAdapter());
  Hive.registerAdapter(FavoriteWordHiveModelAdapter());
  final historyBox = await Hive.openBox<WordHiveModel>('history');
  final favoritesBox = await Hive.openBox<FavoriteWordHiveModel>('favorites');
  final settingsBox = await Hive.openBox<AppSettingsHiveModel>('settings');

  const configString =
      String.fromEnvironment('dictionary', defaultValue: 'Default');
  final currentConfig = EnvironmentConfig.values
      .where((envConfig) =>
          envConfig.name.toLowerCase() == configString.toLowerCase())
      .firstOrNull;
  if (currentConfig == null) {
    throw Exception('Неверная переменная запуска $configString');
  }

  if (!kIsWeb) {
    final tempDir = await getTemporaryDirectory();
    coreModule(currentConfig, HiveCacheStore(tempDir.path));
  } else {
    coreModule(currentConfig);
  }

  authModule(settingsBox, currentConfig);
  wordListModule(currentConfig);
  favoriteModule(settingsBox, favoritesBox);
  detailModule(currentConfig);
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
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => AuthBloc(GetIt.I<AuthRepository>())),
          BlocProvider(
              create: (context) => ProfileCubit(GetIt.I<ProfileRepository>()))
        ],
        child: ValueListenableBuilder(
          valueListenable:
              Hive.box<AppSettingsHiveModel>('settings').listenable(),
          builder: (context, box, child) {
            if (box.isEmpty) {
              box.put('AppSettings', AppSettingsHiveModel());
            }
            final appSettings = box
                .get('AppSettings', defaultValue: AppSettingsHiveModel())!
                .toModel();
            context.read<ProfileCubit>().settings(appSettings);
            return MaterialApp.router(
              builder: (context, child) {
                return MediaQuery(
                    data: MediaQuery.of(context).copyWith(
                        textScaler:
                            TextScaler.linear(appSettings.settings.fontSize)),
                    child: child!);
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
      SettingsThemeMode.system =>
        MediaQuery.of(context).platformBrightness == Brightness.light
            ? lightTheme
            : darkTheme,
      SettingsThemeMode.light => lightTheme,
      SettingsThemeMode.dark => darkTheme,
    };
  }
}
