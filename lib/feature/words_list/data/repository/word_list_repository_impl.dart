import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:hive/hive.dart';
import 'package:rus_bal_dict/core/model/word/word.dart';

import '../../../../core/hive/settings/app_settings_hive.dart';
import '../../domain/repository/words_list_repository.dart';
import 'package:talker/talker.dart';

const String _singleSettingsKey = 'AppSettings';

class WordsListRepositoryImpl implements WordsListRepository {
  final Dio dio;
  final Talker talker;

  WordsListRepositoryImpl({required this.dio, required this.talker});

  @override
  Future<Either<Exception, List<Word>>> fetchWords(
      {required String query, required int page, required int size}) async {
    try {
      //final favoriteWords = await favorites();
      final response = await dio.get('words/$query', queryParameters: {'page': page, 'size': size});
      Iterable responseData = response.data;
      var words = List<Word>.from(responseData.map((json) => Word.fromJson(json)).toList());
      //words = words.map((word) => word.copyWith(isFavorite: favoriteWords.contains(word))).toList();
      return Right(words);
    } on Exception catch (e, s) {
      talker.handle(e, s, 'Error in $runtimeType');
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, int>> wordsCount({required String query}) async {
    try {
      Response<int> response = await dio.get('words_count/$query', queryParameters: {'name': query});
      return Right(response.data ?? 0);
    } on Exception catch (e, s) {
      talker.handle(e, s, 'Error in $runtimeType');
      return Left(e);
    }
  }

  Future<Set<Word>> favorites() async {
    var appSettings =
        Hive.box('favorites').get(_singleSettingsKey, defaultValue: AppSettingsHiveModel())!.toModel();
    final favoriteWordsResponse =
        await dio.get('favorite_words/', queryParameters: {'user_id': appSettings.userInfo.id});
    Iterable iterableResponse = favoriteWordsResponse.data;
    return Set<Word>.from(iterableResponse.map((json) => Word.fromJson(json)));
  }
}
