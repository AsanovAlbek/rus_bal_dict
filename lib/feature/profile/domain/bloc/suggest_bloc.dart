import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rus_bal_dict/feature/profile/domain/bloc/suggest_event.dart';
import 'package:rus_bal_dict/feature/profile/domain/bloc/suggest_state.dart';
import 'package:rus_bal_dict/feature/profile/domain/repository/new_suggest_repository.dart';
import 'package:talker/talker.dart';

class SuggestBloc extends Bloc<SuggestEvent, SuggestState> {
  final NewSuggestRepository repository;
  final Talker? logger;
  SuggestBloc(this.repository, {this.logger}) : super(SuggestStateLoading()) {
    on<GetSuggestsEvent>(_getUserSuggests);
    on<SuggestWordEvent>(_suggest);
  }

  SuggestStateLoaded _loaded = SuggestStateLoaded();

  FutureOr<void> _getUserSuggests(
      GetSuggestsEvent event, Emitter<SuggestState> emit) {}

  FutureOr<void> _suggest(SuggestWordEvent event, Emitter<SuggestState> emit) async {
final suggestEither = await repository.suggest(event.word, event.meaning);
    suggestEither.either((error) {
      logger?.debug("Suggest ${event.word} error $error");
      event.onError?.call();
    }, (response) {
      logger?.debug("Suggest ${event.word} success");
      event.onSuccess?.call(response.message);
    });
  }
}
