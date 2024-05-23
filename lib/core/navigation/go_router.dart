import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:rus_bal_dict/feature/auth/presentation/auth_screen.dart';
import 'package:rus_bal_dict/feature/favorites/presentation/favorites_screen.dart';
import 'package:rus_bal_dict/feature/home/presentation/home_screen.dart';
import 'package:rus_bal_dict/feature/settings/presentation/settings_screen.dart';
import 'package:rus_bal_dict/feature/word_detail/presentation/detail_screen.dart';
import 'package:rus_bal_dict/feature/words_list/presentation/words_list_screen.dart';

import '../model/word.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root shell');
final _wordsListScreenNavigationKey = GlobalKey<NavigatorState>(debugLabel: 'words list shell');
final _favoritesScreenNavigationKey = GlobalKey<NavigatorState>(debugLabel: 'favorites shell');
final _settingsScreenNavigationKey = GlobalKey<NavigatorState>(debugLabel: 'settings shell');

class AppRouter {
  final router = GoRouter(navigatorKey: _rootNavigatorKey, initialLocation: '/word_list', routes: [
    GoRoute(path: '/', builder: (context, state) => const AuthScreen()),
    StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return HomeScreen(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(navigatorKey: _wordsListScreenNavigationKey, routes: [
            GoRoute(
                path: '/word_list',
                builder: (context, state) => const WordsListScreen(),
                routes: [
                  GoRoute(
                      path: 'word_detail', builder: (context, state) => WordsDetailScreen(word: state.extra as Word?))
                ]),
          ]),
          StatefulShellBranch(navigatorKey: _favoritesScreenNavigationKey, routes: [
            GoRoute(
                path: '/favorites',
                builder: (context, state) => const FavoritesScreen(),
                routes: [
                  GoRoute(
                      path: 'word_detail', builder: (context, state) => WordsDetailScreen(word: state.extra as Word?))
                ]),
          ]),
          StatefulShellBranch(navigatorKey: _settingsScreenNavigationKey, routes: [
            GoRoute(path: '/settings', builder: (context, state) => const SettingsScreen())
          ])
        ])
  ]);
}
