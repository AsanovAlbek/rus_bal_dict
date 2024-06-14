import 'package:rus_bal_dict/core/hive/favorite_word/favorite_word_hive_model.dart';

import '../../../core/model/word/word.dart';

extension WordToHive on Word {
  FavoriteWordHiveModel toFavoritesHive({required int userId}) {
    return FavoriteWordHiveModel(
        id: 0,
        wordId: id ?? 0,
        userId: userId,
        word: word,
        meaning: meaning,
        audioBytes: null,
        audioUrl: audioUrl,
        editedTime: DateTime.now().millisecondsSinceEpoch);
  }
}

extension HiveToWord on FavoriteWordHiveModel {
  Word toFavoritesModel() {
    return Word(id: wordId, word: word, meaning: meaning, audioUrl: audioUrl ?? '', isFavorite: true);
  }
}
