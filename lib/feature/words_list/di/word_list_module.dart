import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rus_bal_dict/core/di/core_module.dart';
import 'package:rus_bal_dict/core/network/api/dictionary/dictionary_service.dart';
import 'package:rus_bal_dict/feature/words_list/data/repository/new_words_repository_impl.dart';
import 'package:rus_bal_dict/feature/words_list/data/repository/word_list_repository_impl.dart';
import 'package:rus_bal_dict/feature/words_list/domain/repository/words_list_repository.dart';
import 'package:talker/talker.dart';

final di = GetIt.instance;

void wordListModule() {
  di.registerSingleton<WordsListRepository>(NewWordsRepositoryImpl(
      di<DictionaryService>(),
      di<Talker>()));
}
