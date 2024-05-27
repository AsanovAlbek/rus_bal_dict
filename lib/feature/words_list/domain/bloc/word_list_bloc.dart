import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rus_bal_dict/feature/words_list/domain/bloc/word_list_event.dart';
import 'package:rus_bal_dict/feature/words_list/domain/bloc/word_list_state.dart';
import 'package:talker/talker.dart';

import '../repository/words_list_repository.dart';

class WordsListBloc extends Bloc<WordsListEvent, WordsListState> {
  final WordsListRepository repository;

  WordsListBloc({required this.repository}) : super(WordsListState.loading()) {
    on<WordsListEventFetch>(_fetch);
  }

  var _loaded = WordsListStateLoaded();

  FutureOr<void> _fetch(WordsListEventFetch event, Emitter<WordsListState> emit) async {
    if (state is! WordsListStateLoading) {
      emit(WordsListState.loading());
    }
    final wordsCount = await repository.wordsCount(query: event.query ?? _loaded.query);
    wordsCount.either((error) {
      emit(WordsListState.error(message: error.toString()));
      event.onError?.call(error);
    }, (count) {
      _loaded = _loaded.copyWith(totalWordsCount: count);
      event.onSuccess?.call(_loaded.words, _loaded.totalWordsCount);
      Talker().debug('page = ${_loaded.currentPage}');
    });
    final wordListResult = await repository.fetchWords(
        query: event.query ?? _loaded.query, page: event.page ?? _loaded.currentPage, size: _loaded.totalWordsCount);
    wordListResult.either((exception) {
      emit(WordsListState.error(message: exception.toString()));
    }, (words) {
      _loaded = _loaded.copyWith(words: words);
      emit(_loaded);
    });
  }
}
