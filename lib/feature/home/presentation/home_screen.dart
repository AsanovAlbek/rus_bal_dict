import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:rus_bal_dict/feature/favorites/domain/bloc/favorites_bloc.dart';
import 'package:rus_bal_dict/feature/favorites/domain/repository/favorites_repository.dart';
import 'package:rus_bal_dict/feature/history/domain/bloc/history_bloc.dart';
import 'package:rus_bal_dict/feature/history/domain/bloc/history_event.dart';
import 'package:rus_bal_dict/feature/history/domain/repository/history_repository.dart';
import 'package:rus_bal_dict/feature/words_list/domain/bloc/word_list_bloc.dart';
import 'package:rus_bal_dict/feature/words_list/domain/repository/words_list_repository.dart';
import 'package:rus_bal_dict/icons.dart';

import '../../words_list/domain/bloc/word_list_event.dart';

class HomeScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const HomeScreen({super.key, required this.navigationShell});

  void _onSelectNavBar(int index) {
    navigationShell.goBranch(index, initialLocation: index == navigationShell.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) =>
              WordsListBloc(repository: GetIt.I<WordsListRepository>())..add(WordsListEvent.fetch()),
        ),
        BlocProvider(
            create: (context) => HistoryBloc(GetIt.I<HistoryRepository>())..add(HistoryEvent.getHistory())),
        BlocProvider(
            create: (context) =>
                FavoritesBloc(GetIt.I<FavoritesRepository>())) //..add(FavoritesEvent.load()))
      ], child: navigationShell),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home, size: 32), label: 'Главная'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/favorites.svg',
                colorFilter:
                    ColorFilter.mode(Theme.of(context).iconTheme.color ?? Colors.black, BlendMode.srcIn),
              ),
              label: 'Избранное'),
          const BottomNavigationBarItem(icon: Icon(Icons.history, size: 32), label: 'Недавние'),
          const BottomNavigationBarItem(icon: Icon(Icons.person, size: 32), label: 'Профиль')
        ],
        onTap: _onSelectNavBar,
      ),
    );
  }
}
