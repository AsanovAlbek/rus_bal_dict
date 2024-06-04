import 'package:rus_bal_dict/core/hive/word/word_hive_model.dart';

import '../../model/word/word.dart';

extension WordToHive on Word {
  WordHiveModel toHive(int userId) => WordHiveModel(id: id ?? 0, word: word, meaning: meaning, audioUrl: audioUrl, createTime: DateTime.now().millisecond, userId: userId);
}

extension HiveToWord on WordHiveModel {
  Word toModel() => Word(id: id, word: word, meaning: meaning, audioUrl: audioUrl);
}