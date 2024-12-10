import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/model/word/word.dart';

sealed class FavoritesEvent {
  static LoadFavoritesEvent load() => LoadFavoritesEvent();

  static DeleteFromFavoritesEvent deleteFromFavorites(
          {required Word word,
          Function(Word)? onSuccess,
          Function(String?)? onError}) =>
      DeleteFromFavoritesEvent(word: word);

  static AddToFavoritesEvent addToFavorites(
          {required Word word,
          Function(Word)? onSuccess,
          Function(String?)? onError}) =>
      AddToFavoritesEvent(word: word);
}

@immutable
class LoadFavoritesEvent extends FavoritesEvent {}

@immutable
class DeleteFromFavoritesEvent extends FavoritesEvent {
  final Word word;
  final Function(Word)? onSuccess;
  final Function(String?)? onError;

  DeleteFromFavoritesEvent({required this.word, this.onSuccess, this.onError});
}

@immutable
class AddToFavoritesEvent extends FavoritesEvent {
  final Word word;
  final Function(Word)? onSuccess;
  final Function(String?)? onError;

  AddToFavoritesEvent({required this.word, this.onSuccess, this.onError});
}
