import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:rus_bal_dict/feature/favorites/domain/bloc/favorites_bloc.dart';
import 'package:rus_bal_dict/feature/favorites/domain/bloc/favorites_event.dart';
import 'package:rus_bal_dict/feature/favorites/domain/repository/favorites_repository.dart';
import 'package:rus_bal_dict/feature/history/domain/bloc/history_bloc.dart';
import 'package:rus_bal_dict/feature/history/domain/bloc/history_event.dart';
import 'package:rus_bal_dict/feature/history/domain/repository/history_repository.dart';
import 'package:rus_bal_dict/feature/words_list/domain/bloc/word_list_bloc.dart';
import 'package:rus_bal_dict/feature/words_list/domain/repository/words_list_repository.dart';

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
      body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  WordsListBloc(repository: GetIt.I<WordsListRepository>())..add(WordsListEvent.fetch()),
            ),
            BlocProvider(
                create: (context) =>
                    HistoryBloc(GetIt.I<HistoryRepository>())..add(HistoryEvent.getHistory())),
            BlocProvider(
                create: (context) =>
                    FavoritesBloc(GetIt.I<FavoritesRepository>())..add(FavoritesEvent.load()))
          ],
          child: navigationShell),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главная'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Сохраненные'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Недавние'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профиль')
        ],
        onTap: _onSelectNavBar,
      ),
    );
  }
}
