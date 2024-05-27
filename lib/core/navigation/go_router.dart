import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:rus_bal_dict/feature/auth/presentation/auth_screen.dart';
import 'package:rus_bal_dict/feature/favorites/presentation/favorites_screen.dart';
import 'package:rus_bal_dict/feature/home/presentation/home_screen.dart';
import 'package:rus_bal_dict/feature/profile/presentation/profile_screen.dart';
import 'package:rus_bal_dict/feature/word_detail/presentation/detail_screen.dart';
import 'package:rus_bal_dict/feature/words_list/presentation/words_list_screen.dart';

import '../../feature/history/presentation/history_screen.dart';
import '../model/word.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root shell');
final _wordsListScreenNavigationKey = GlobalKey<NavigatorState>(debugLabel: 'words list shell');
final _favoritesScreenNavigationKey = GlobalKey<NavigatorState>(debugLabel: 'favorites shell');
final _historyScreenNavigationKey = GlobalKey<NavigatorState>(debugLabel: 'history shell');
final _profileScreenNavigationKey = GlobalKey<NavigatorState>(debugLabel: 'settings shell');

class AppRouter {
  final router = GoRouter(navigatorKey: _rootNavigatorKey, initialLocation: '/word_list', routes: [
    GoRoute(path: '/', builder: (context, state) => const AuthScreen()),
    StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return HomeScreen(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(navigatorKey: _wordsListScreenNavigationKey, routes: [
            GoRoute(path: '/word_list', builder: (context, state) => const WordsListScreen(), routes: [
              GoRoute(
                  path: 'word_detail',
                  builder: (context, state) => WordsDetailScreen(word: state.extra as Word?))
            ]),
          ]),
          StatefulShellBranch(navigatorKey: _favoritesScreenNavigationKey, routes: [
            GoRoute(path: '/favorites', builder: (context, state) => const FavoritesScreen(), routes: [
              GoRoute(
                  path: 'word_detail',
                  builder: (context, state) => WordsDetailScreen(word: state.extra as Word?))
            ]),
          ]),
          StatefulShellBranch(navigatorKey: _historyScreenNavigationKey, routes: [
            GoRoute(path: '/history', builder: (context, state) => const HistoryScreen(), routes: [
              GoRoute(
                  path: 'word_detail',
                  builder: (context, state) => WordsDetailScreen(word: state.extra as Word?))
            ])
          ]),
          StatefulShellBranch(
              navigatorKey: _profileScreenNavigationKey,
              routes: [GoRoute(path: '/profile', builder: (context, state) => const ProfileScreen())])
        ])
  ]);
}
