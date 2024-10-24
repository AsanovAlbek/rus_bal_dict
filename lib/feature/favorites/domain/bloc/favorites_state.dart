import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/model/word/word.dart';

sealed class FavoritesState {
  static FavoritesStateLoading loading() => FavoritesStateLoading();
  static FavoritesStateError error({String? message}) =>
      FavoritesStateError(message: message);
  static FavoritesStateLoaded loaded({List<Word> words = const <Word>[]}) =>
      FavoritesStateLoaded(favorites: words);
}

@immutable
class FavoritesStateLoading extends FavoritesState {}

@immutable
class FavoritesStateLoaded extends FavoritesState {
  final List<Word> favorites;

  FavoritesStateLoaded({this.favorites = const <Word>[]});

  FavoritesStateLoaded copyWith({List<Word>? favorites}) {
    return FavoritesStateLoaded(favorites: favorites ?? this.favorites);
  }
}

@immutable
class FavoritesStateError extends FavoritesState {
  final String? message;

  FavoritesStateError({this.message});
}
