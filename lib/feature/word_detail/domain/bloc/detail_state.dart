import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

sealed class DetailState {}

class DetailStateLoaded extends DetailState with EquatableMixin {
  final Uint8List? bytes;
  final bool isFavorite;
  DetailStateLoaded({this.bytes, this.isFavorite = false});

  @override
  List<Object?> get props => [bytes];

  DetailStateLoaded copyWith({Uint8List? bytes, bool? isFavorite}) {
    return DetailStateLoaded(
        bytes: bytes ?? this.bytes, isFavorite: isFavorite ?? this.isFavorite);
  }
}

class DetailStateError extends DetailState {
  final Exception? exception;

  DetailStateError({this.exception});
}

class DetailStateLoading extends DetailState {
  DetailStateLoading();
}
