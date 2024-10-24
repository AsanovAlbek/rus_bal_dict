import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:rus_bal_dict/core/hive/favorite_word/favorite_word_hive_model.dart';
import 'package:rus_bal_dict/core/widgets/my_app_bar.dart';
import 'package:rus_bal_dict/core/widgets/word_list_item.dart';
import 'package:rus_bal_dict/feature/favorites/data/converter.dart';
import 'package:rus_bal_dict/feature/favorites/domain/bloc/favorites_bloc.dart';
import 'package:rus_bal_dict/feature/favorites/domain/bloc/favorites_event.dart';
import 'package:rus_bal_dict/feature/favorites/domain/bloc/favorites_state.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable:
          Hive.box<FavoriteWordHiveModel>('favorites').listenable(),
      builder: (context, box, child) {
        var favoriteWords = box.values.toList();
        favoriteWords.sort(
            (first, second) => second.editedTime.compareTo(first.editedTime));
        final words = favoriteWords
            .map((hiveModel) => hiveModel.toFavoritesModel())
            .toList();
        return BlocBuilder<FavoritesBloc, FavoritesState>(
            builder: (context, state) {
          return CustomScrollView(
            slivers: [
              const MyAppBar(title: 'Избранное'),
              switch (state) {
                FavoritesStateLoading() => const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  ),
                FavoritesStateLoaded(favorites: final favorites) => words
                        .isNotEmpty
                    ? SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          return WordListItem(
                            //word: favorites[index],
                            word: words[index],
                            saveEnable: true,
                            isFavorite: true,
                            onPressed: (word) => context
                                .go('/favorites/word_detail', extra: word),
                            onSaveWord: (word) {
                              context.read<FavoritesBloc>().add(
                                  FavoritesEvent.deleteFromFavorites(
                                      word: word));
                            },
                          );
                        }, childCount: words.length),
                      )
                    : const SliverFillRemaining(
                        child: Center(
                          child: Text('Здесь пока ничего нет'),
                        ),
                      ),
                FavoritesStateError(message: String? message) =>
                  SliverFillRemaining(
                    child: Center(
                      child: Text('$message'),
                    ),
                  ),
              }
            ],
          );
        });
      },
    );
  }
}
