import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rus_bal_dict/core/widgets/my_app_bar.dart';
import 'package:rus_bal_dict/core/widgets/word_list_item.dart';
import 'package:rus_bal_dict/feature/favorites/domain/bloc/favorites_bloc.dart';
import 'package:rus_bal_dict/feature/favorites/domain/bloc/favorites_event.dart';
import 'package:rus_bal_dict/feature/favorites/domain/bloc/favorites_state.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(builder: (context, state) {
      return RefreshIndicator(
        onRefresh: () => Future.sync(() => context.read<FavoritesBloc>().add(FavoritesEvent.load())),
        child: CustomScrollView(
          slivers: [
            const MyAppBar(title: 'Избранное'),
            switch (state) {
              FavoritesStateLoading() => const SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
                ),
              FavoritesStateLoaded(favorites: final favorites) => favorites.isNotEmpty ? SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return WordListItem(
                      word: favorites[index],
                      saveEnable: true,
                      onPressed: (word) => context.go('/favorites/word_detail', extra: word),
                      onSaveWord: (word) {
                        context.read<FavoritesBloc>().add(FavoritesEvent.deleteFromFavorites(word: word));
                      },
                    );
                  }, childCount: favorites.length),
                ) : const SliverFillRemaining(child: Center(child: Text('Здесь пока ничего нет'),),),
              FavoritesStateError(message: String? message) => SliverFillRemaining(child: Center(child: Text('$message'),),),
            }
          ],
        ),
      );
    });
  }
}
