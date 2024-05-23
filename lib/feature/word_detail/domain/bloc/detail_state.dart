import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

sealed class DetailState {

}

class DetailStateLoaded extends DetailState with EquatableMixin {
  final Uint8List? bytes;
  DetailStateLoaded({this.bytes});

  @override
  List<Object?> get props => [bytes];
}

class DetailStateError extends DetailState {
  final Exception? exception;

  DetailStateError({this.exception});
}

class DetailStateLoading extends DetailState{

  DetailStateLoading();
}