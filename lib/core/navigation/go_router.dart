import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:rus_bal_dict/core/constants/config.dart';
import 'package:rus_bal_dict/core/hive/settings/app_settings_hive.dart';
import 'package:rus_bal_dict/core/model/settings/converter.dart';
import 'package:rus_bal_dict/feature/auth/presentation/view/auth_screen.dart';
import 'package:rus_bal_dict/feature/auth/presentation/view/input_code_screen.dart';
import 'package:rus_bal_dict/feature/auth/presentation/view/new_password_screen.dart';
import 'package:rus_bal_dict/feature/auth/presentation/view/restore_password_screen.dart';
import 'package:rus_bal_dict/feature/favorites/presentation/favorites_screen.dart';
import 'package:rus_bal_dict/feature/home/presentation/home_screen.dart';
import 'package:rus_bal_dict/feature/profile/presentation/screen/profile_screen.dart';
import 'package:rus_bal_dict/feature/profile/presentation/screen/settings_screen.dart';
import 'package:rus_bal_dict/feature/word_detail/presentation/detail_screen.dart';
import 'package:rus_bal_dict/feature/words_list/presentation/words_list_screen.dart';

import '../../feature/history/presentation/history_screen.dart';
import '../model/word/word.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root shell');
final _wordsListScreenNavigationKey =
    GlobalKey<NavigatorState>(debugLabel: 'words list shell');
final _favoritesScreenNavigationKey =
    GlobalKey<NavigatorState>(debugLabel: 'favorites shell');
final _historyScreenNavigationKey =
    GlobalKey<NavigatorState>(debugLabel: 'history shell');
final _profileScreenNavigationKey =
    GlobalKey<NavigatorState>(debugLabel: 'settings shell');

class AppRouter {
  final EnvironmentConfig config;
  late final GoRouter router;
  AppRouter(this.config) {
    router = GoRouter(
        navigatorKey: _rootNavigatorKey,
        initialLocation: '/auth',
        routes: [
          GoRoute(
              path: '/auth',
              redirect: (context, state) {
                final settingsBox = Hive.box<AppSettingsHiveModel>('settings');
                final settings =
                    (settingsBox.getAt(0) ?? AppSettingsHiveModel()).toModel();
                if (settings.userInfo.isUserSignIn &&
                    state.uri.path == '/auth') {
                  return '/word_list';
                }
                return null;
              },
              builder: (context, state) => const AuthScreen(),
              routes: [
                GoRoute(
                    path: 'restore_password',
                    builder: (context, state) => const RestorePasswordScreen(),
                    routes: [
                      GoRoute(
                          path: 'input_code',
                          builder: (context, state) => const InputCodeScreen(), routes: [
                            GoRoute(
                              path: 'new_password',
                              builder: (context, state) => const NewPasswordScreen(),
                            )
                          ]),
                    ])
              ]),
          StatefulShellRoute.indexedStack(
              builder: (context, state, navigationShell) {
                return HomeScreen(navigationShell: navigationShell);
              },
              branches: [
                StatefulShellBranch(
                    navigatorKey: _wordsListScreenNavigationKey,
                    routes: [
                      GoRoute(
                          path: '/word_list',
                          builder: (context, state) => const WordsListScreen(),
                          routes: [
                            GoRoute(
                                path: 'word_detail',
                                builder: (context, state) => WordsDetailScreen(
                                    word: state.extra as Word?))
                          ]),
                    ]),
                StatefulShellBranch(
                    navigatorKey: _favoritesScreenNavigationKey,
                    routes: [
                      GoRoute(
                          path: '/favorites',
                          builder: (context, state) => const FavoritesScreen(),
                          routes: [
                            GoRoute(
                                path: 'word_detail',
                                builder: (context, state) => WordsDetailScreen(
                                    word: state.extra as Word?))
                          ]),
                    ]),
                StatefulShellBranch(
                    navigatorKey: _historyScreenNavigationKey,
                    routes: [
                      GoRoute(
                          path: '/history',
                          builder: (context, state) => const HistoryScreen(),
                          routes: [
                            GoRoute(
                                path: 'word_detail',
                                builder: (context, state) => WordsDetailScreen(
                                    word: state.extra as Word?))
                          ])
                    ]),
                StatefulShellBranch(
                    navigatorKey: _profileScreenNavigationKey,
                    routes: [
                      GoRoute(
                          path: '/profile',
                          builder: (context, state) => const ProfileScreen(),
                          routes: [
                            GoRoute(
                                path: 'settings',
                                builder: (context, state) =>
                                    const SettingsScreen())
                          ])
                    ])
              ])
        ]);
  }
}
