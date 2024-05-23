import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
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
      body: BlocProvider(
          create: (context) => WordsListBloc(repository: GetIt.I<WordsListRepository>()),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: navigationShell,
          )),
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Главная'),
          NavigationDestination(icon: Icon(Icons.bookmark), label: 'Сохраненные'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Настройки')
        ],
        onDestinationSelected: _onSelectNavBar,
      ),
    );
  }
}
