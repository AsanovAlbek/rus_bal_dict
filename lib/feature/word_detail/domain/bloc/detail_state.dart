import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:rus_bal_dict/core/model/word/word.dart';

sealed class DetailState {}

class DetailStateLoaded extends DetailState with EquatableMixin {
  final Uint8List? bytes;
  final bool isFavorite;
  final Word word;
  DetailStateLoaded(
      {this.bytes, this.isFavorite = false, this.word = const Word()});

  @override
  List<Object?> get props => [bytes, word];

  DetailStateLoaded copyWith({Uint8List? bytes, bool? isFavorite, Word? word}) {
    return DetailStateLoaded(
        bytes: bytes ?? this.bytes,
        isFavorite: isFavorite ?? this.isFavorite,
        word: word ?? this.word);
  }

  @override
  bool? get stringify => true;
}

class DetailStateError extends DetailState {
  final Exception? exception;

  DetailStateError({this.exception});
}

class DetailStateLoading extends DetailState {
  DetailStateLoading();
}
