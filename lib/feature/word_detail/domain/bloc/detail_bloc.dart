import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rus_bal_dict/feature/word_detail/domain/bloc/detail_event.dart';
import 'package:rus_bal_dict/feature/word_detail/domain/bloc/detail_state.dart';

import '../repository/detail_repository.dart';

class DetailBloc extends Bloc<GetAudioEvent, DetailState> {
  final DetailRepository repository;

  DetailBloc(this.repository) : super(DetailStateLoading()) {
    on<GetAudioEvent>(_getAudio);
  }

  FutureOr<void> _getAudio(GetAudioEvent event, Emitter<DetailState> emit) async {
    final audioEither = await repository.getAudioByPath(audioPath: event.audioUrl ?? '');
    audioEither.either(
        (exception) => emit(DetailStateError(exception: exception)), (bytes) => emit(DetailStateLoaded(bytes: bytes)));
  }
}
