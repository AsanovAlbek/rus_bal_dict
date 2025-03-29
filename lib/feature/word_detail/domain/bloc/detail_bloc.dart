import 'dart:async';
import 'dart:convert';

import 'package:rus_bal_dict/core/model/login_data/login_data.dart';
import 'package:rus_bal_dict/core/model/word/word.dart';
import 'package:rus_bal_dict/feature/history/presentation/history.dart';
import 'package:rus_bal_dict/feature/word_detail/domain/bloc/detail_event.dart';
import 'package:rus_bal_dict/feature/word_detail/domain/bloc/detail_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repository/detail_repository.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final DetailRepository repository;
  final Talker? logger;

  DetailBloc(this.repository, {this.logger}) : super(DetailStateLoaded()) {
    on<GetAudioEvent>(_getAudio);
    on<ChangeFavoriteEvent>(_changeFavorite);
    on<OpenWordEvent>(_openWord);
    on<LoadLastWordEvent>(_loadLastWord);
  }

  var _wordState = DetailStateLoaded();

  FutureOr<void> _getAudio(
      GetAudioEvent event, Emitter<DetailState> emit) async {
    final audioEither =
        await repository.getAudioByPath(audioPath: event.audioUrl ?? '');
    audioEither.either((exception) {
      emit(DetailStateError(exception: exception));
    }, (bytes) {
      _wordState = _wordState.copyWith(bytes: bytes);
      emit(_wordState);
    });
  }

  FutureOr<void> _changeFavorite(
      ChangeFavoriteEvent event, Emitter<DetailState> emit) {
    _wordState = _wordState.copyWith(isFavorite: !_wordState.isFavorite);
    emit(_wordState);
  }

  FutureOr<void> _openWord(OpenWordEvent event, Emitter<DetailState> emit) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString("lastWord", jsonEncode(event.word.toJson()));
    _wordState = _wordState.copyWith(word: event.word);
    logger?.info("Word = ${_wordState.word.word} event word = ${event.word.word}");
    emit(_wordState);
    event.onOpen?.call();
  }

  FutureOr<void> _loadLastWord(LoadLastWordEvent event, Emitter<DetailState> emit) async {
    var prefs = await SharedPreferences.getInstance();
    var data = prefs.getString('lastWord') ?? jsonEncode(const Word().toJson());
    var lastWord = Word.fromJson(jsonDecode(data) as Map<String, dynamic>);
    _wordState = _wordState.copyWith(word: lastWord);
    logger?.info(" word ${lastWord.word} loaded");
    emit(_wordState);
  }
}
