import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:rus_bal_dict/core/hive/word/converter.dart';
import 'package:rus_bal_dict/core/model/word/word.dart';
import 'package:rus_bal_dict/feature/history/domain/repository/history_repository.dart';
import 'package:talker/talker.dart';

import '../../../../core/hive/word/word_hive_model.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  final Box<WordHiveModel> _historyBox;
  final Talker _talker = GetIt.I<Talker>();

  HistoryRepositoryImpl(this._historyBox);

  @override
  Future<List<Word>> clearHistory() async {
    final wordsFromHistory = _historyBox.values.map((hiveModel) => hiveModel.toModel()).toList();
    _historyBox.clear();
    return wordsFromHistory;
  }

  @override
  Future<void> saveWord(Word word) async {
    final hiveModel = word.toHive();
    _talker.debug('model = ${hiveModel.id}, ${hiveModel.word} exists = ${_historyBox.containsKey(hiveModel.id)}');
    if (_historyBox.containsKey(hiveModel.id)) {
      await _historyBox.delete(hiveModel.id);
      _talker.debug('after delete model exists = ${_historyBox.containsKey(hiveModel.id)}');
    }
    _historyBox.put(hiveModel.id, hiveModel);
  }

  @override
  Stream<Word> wordsFromHistory() {
    return _historyBox.watch().map((event) => (event.value as WordHiveModel).toModel());
  }
}