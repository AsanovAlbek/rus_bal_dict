import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rus_bal_dict/feature/words_list/domain/bloc/word_list_event.dart';
import 'package:rus_bal_dict/feature/words_list/domain/bloc/word_list_state.dart';
import 'package:talker/talker.dart';

import '../repository/words_list_repository.dart';

class WordsListBloc extends Bloc<WordsListEvent, WordsListState> {
  final WordsListRepository repository;

  WordsListBloc({required this.repository}) : super(WordsListState.loading()) {
    on<WordsListEventFetch>(_fetch, transformer: droppable());
    on<ChangeScrollableUpEvent>(_changeScrollUp);
  }

  var _loaded = WordsListState.loaded();

  FutureOr<void> _fetch(WordsListEventFetch event, Emitter<WordsListState> emit) async {
    if (event.query != null && event.query != _loaded.query) {
      _loaded = _loaded.copyWith(words: [], currentPage: 0, query: event.query);
    }
    
    final wordsCount = await repository.wordsCount(query: event.query ?? _loaded.query);
    wordsCount.either((error) {
      emit(WordsListState.error(message: error.toString()));
      event.onError?.call(error);
      event.completer?.completeError(error);
    }, (count) {
      if (count != _loaded.totalWordsCount) {
        _loaded = _loaded.copyWith(currentPage: 0, words: []);
      }
      _loaded = _loaded.copyWith(totalWordsCount: count);
      Talker().debug('page = ${_loaded.currentPage} words count = $count');
    });
    if (_loaded.totalWordsCount <= 0) {
      emit(WordsListState.empty(message: 'Таких слов пока нет, но вы можете предложить слово'));
    } else if (_loaded.words.length < _loaded.totalWordsCount) {
      final wordListResult = await repository.fetchWords(
          query: event.query ?? _loaded.query, page: _loaded.currentPage, size: 80);
      wordListResult.either((exception) {
        emit(WordsListState.error(message: exception.toString()));
        event.completer?.completeError(exception);
      }, (words) {
        _loaded = _loaded.copyWith(words: [..._loaded.words, ...words]);
        Talker().debug('words count ${_loaded.words.length}');
        emit(_loaded);
      });
      _loaded = _loaded.copyWith(currentPage: _loaded.currentPage + 1);
    }
    event.completer?.complete();
    event.onSuccess?.call(_loaded.words, _loaded.totalWordsCount);
  }

  FutureOr<void> _changeScrollUp(ChangeScrollableUpEvent event, Emitter<WordsListState> emit) {
    _loaded = _loaded.copyWith(canScrollUp: event.canScroll);
    emit(_loaded);
  }
}
