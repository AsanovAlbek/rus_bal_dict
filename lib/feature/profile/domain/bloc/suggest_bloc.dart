import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rus_bal_dict/feature/profile/domain/bloc/suggest_event.dart';
import 'package:rus_bal_dict/feature/profile/domain/bloc/suggest_state.dart';
import 'package:rus_bal_dict/feature/profile/domain/repository/new_suggest_repository.dart';

class SuggestBloc extends Bloc<SuggestEvent, SuggestState> {
  final NewSuggestRepository repository;
  SuggestBloc(this.repository) : super(SuggestStateLoading()) {
    on<GetSuggestsEvent>(_getUserSuggests);
    on<SuggestWordEvent>(_suggest);
  }

  SuggestStateLoaded _loaded = SuggestStateLoaded();

  FutureOr<void> _getUserSuggests(
      GetSuggestsEvent event, Emitter<SuggestState> emit) async {
    if (event.name != null && event.name != _loaded.query) {
      _loaded =
          _loaded.copyWith(userSuggests: [], currentPage: 0, query: event.name);
    }

    final suggestCountEither = await repository.suggestsCount(event.name ?? '');
    suggestCountEither.either((error) {
      emit(SuggestStateError('Не удалось загрузить предложенные вами слова'));
    }, (totalCount) async {
      if (totalCount != _loaded.totalWordsCount) {
        _loaded = _loaded.copyWith(currentPage: 0, userSuggests: []);
      } else if (_loaded.userSuggests.length < _loaded.totalWordsCount) {}
      _loaded = _loaded.copyWith(totalWordsCount: totalCount);
    });

    if (_loaded.totalWordsCount <= 0) {
      emit(SuggestStateEmpty(message: 'Ваших слов на рассмотрении пока нет'));
    } else if (_loaded.userSuggests.length < _loaded.totalWordsCount) {
      final getSuggestsEither = await repository.getSuggestWords(
          event.name ?? _loaded.query, _loaded.currentPage, 80);

      getSuggestsEither.either((error) {
        emit(SuggestStateError('Не удалось загрузить предложенные вами слова'));
        event.onError?.call();
      }, (suggestWords) {
        emit(_loaded.copyWith(
            userSuggests: [..._loaded.userSuggests, ...suggestWords]));
        event.onSuccess?.call(suggestWords, _loaded.totalWordsCount);
      });
      _loaded = _loaded.copyWith(currentPage: _loaded.currentPage + 1);
    }
  }

  FutureOr<void> _suggest(
      SuggestWordEvent event, Emitter<SuggestState> emit) async {
    final suggestEither = await repository.suggest(event.suggestWord);
    suggestEither.either((error) {
      event.onError?.call();
    }, (wordResponse) {
      event.onSuccess?.call(wordResponse.message);
    });
  }
}
