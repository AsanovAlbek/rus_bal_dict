import 'package:equatable/equatable.dart';
import 'package:rus_bal_dict/core/model/word/word.dart';

sealed class DetailEvent {}

class GetAudioEvent extends DetailEvent {
  final String? audioUrl;
  GetAudioEvent(this.audioUrl);
}

class ChangeFavoriteEvent extends DetailEvent {
  final bool isFavorite;

  ChangeFavoriteEvent(this.isFavorite);
}

class OpenWordEvent extends DetailEvent with EquatableMixin {
  final Word word;
  final Function()? onOpen;
  OpenWordEvent(this.word, {this.onOpen});
  
  @override
  List<Object?> get props => [word];
}

class LoadLastWordEvent extends DetailEvent {}