sealed class DetailEvent {}

class GetAudioEvent extends DetailEvent {
  final String? audioUrl;
  GetAudioEvent(this.audioUrl);
}

class ChangeFavoriteEvent extends DetailEvent {
  final bool isFavorite;

  ChangeFavoriteEvent(this.isFavorite);
}
