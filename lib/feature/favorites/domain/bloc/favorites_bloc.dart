import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rus_bal_dict/feature/favorites/domain/bloc/favorites_event.dart';
import 'package:rus_bal_dict/feature/favorites/domain/bloc/favorites_state.dart';

import '../repository/favorites_repository.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final FavoritesRepository repository;
  FavoritesBloc(this.repository): super(FavoritesState.loaded()) {
    on<LoadFavoritesEvent>(_loadFavorites);
    on<DeleteFromFavoritesEvent>(_deleteFromFavorites);
    on<AddToFavoritesEvent>(_addToFavorites);
  }

  var _loaded = FavoritesState.loaded();

  FutureOr<void> _loadFavorites(LoadFavoritesEvent event, Emitter<FavoritesState> emit) async {
    final favoritesEither = await repository.getFavoriteWords();
    favoritesEither.either((error) {
      emit(FavoritesState.error(message: error.toString()));
    }, (favorites) {
      _loaded = _loaded.copyWith(favorites: favorites);
      emit(_loaded);
    });
  }

  FutureOr<void> _deleteFromFavorites(DeleteFromFavoritesEvent event, Emitter<FavoritesState> emit) async {
    final deleteFavoritesEither = await repository.deleteFromFavorites(event.word);
    deleteFavoritesEither.either((error) {
      event.onError?.call(error.toString());
    }, (deletedWord) {
      add(FavoritesEvent.load());
      event.onSuccess?.call(deletedWord);
    });
  }

  FutureOr<void> _addToFavorites(AddToFavoritesEvent event, Emitter<FavoritesState> emit) async {
    final addToFavoritesEither = await repository.saveToFavorites(event.word);
    addToFavoritesEither.either((error) {
      event.onError?.call(error.toString());
    }, (deletedWord) {
      add(FavoritesEvent.load());
      event.onSuccess?.call(deletedWord);
    });
  }
}