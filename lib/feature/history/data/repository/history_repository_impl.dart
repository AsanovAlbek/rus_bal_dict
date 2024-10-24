import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:rus_bal_dict/core/hive/word/converter.dart';
import 'package:rus_bal_dict/core/model/word/word.dart';
import 'package:rus_bal_dict/feature/history/domain/repository/history_repository.dart';
import 'package:talker/talker.dart';

import '../../../../core/hive/settings/app_settings_hive.dart';
import '../../../../core/hive/word/word_hive_model.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  final Box<WordHiveModel> _historyBox;
  final Box<AppSettingsHiveModel> _settingsBox;
  final Talker _talker = GetIt.I<Talker>();

  HistoryRepositoryImpl(this._historyBox, this._settingsBox);

  @override
  Future<List<Word>> clearHistory() async {
    final settings = _settingsBox.getAt(0) ?? AppSettingsHiveModel();
    final wordsFromHistory = _historyBox.values
        .where((historyWord) => historyWord.userId == (settings.userId ?? 0))
        .map((hiveModel) {
      _historyBox.delete(hiveModel.id);
      return hiveModel.toModel();
    }).toList();
    return wordsFromHistory;
  }

  @override
  Future<void> saveWord(Word word) async {
    final settings = _settingsBox.getAt(0) ?? AppSettingsHiveModel();
    final hiveModel = word.toHive(settings.userId ?? 0);
    _talker.debug(
        'model = ${hiveModel.id}, ${hiveModel.word} exists = ${_historyBox.containsKey(hiveModel.id)}');
    if (_historyBox.containsKey(hiveModel.id)) {
      await _historyBox.delete(hiveModel.id);
    }
    _historyBox.put(hiveModel.id, hiveModel);
  }

  @override
  Stream<Word> wordsFromHistory() {
    return _historyBox
        .watch()
        .map((event) => (event.value as WordHiveModel).toModel());
  }
}
