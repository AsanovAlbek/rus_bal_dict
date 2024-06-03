import 'package:rus_bal_dict/core/hive/word/word_hive_model.dart';

import '../../model/word/word.dart';

extension WordToHive on Word {
  WordHiveModel toHive() => WordHiveModel(id: id ?? 0, word: word, meaning: meaning, audioUrl: audioUrl, createTime: DateTime.now());
}

extension HiveToWord on WordHiveModel {
  Word toModel() => Word(id: id, word: word, meaning: meaning, audioUrl: audioUrl);
}