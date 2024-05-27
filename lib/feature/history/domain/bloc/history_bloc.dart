import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:rus_bal_dict/feature/history/domain/bloc/history_event.dart';
import 'package:rus_bal_dict/feature/history/domain/bloc/history_state.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:talker/talker.dart';
import '../repository/history_repository.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final HistoryRepository repository;
  final Talker _talker = GetIt.I<Talker>();

  HistoryBloc(this.repository) : super(HistoryState.loading()) {
    on<GetHistoryEvent>(_getWordsFromHistory, transformer: restartable());
    on<ClearHistoryEvent>(_clearHistory);
    on<AddToHistoryEvent>(_addToHistory);
  }

  var _loaded = HistoryState.loaded();

  FutureOr<void> _getWordsFromHistory(GetHistoryEvent event, Emitter<HistoryState> emit) async {
    _talker.debug('get stream from hive');
    await emit.forEach(repository.wordsFromHistory(), onData: (word) {
      _loaded = _loaded.copyWith(words: [..._loaded.wordsFromHistory, word]);
      _talker.debug('word = $word');
      return _loaded;
    });
  }

  FutureOr<void> _clearHistory(ClearHistoryEvent event, Emitter<HistoryState> emit) async {
    repository.clearHistory();
  }

  FutureOr<void> _addToHistory(AddToHistoryEvent event, Emitter<HistoryState> emit) {
    repository.saveWord(event.word);
  }
}