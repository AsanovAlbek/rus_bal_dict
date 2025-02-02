import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:rus_bal_dict/core/constants/private.dart';
import 'package:rus_bal_dict/core/model/word/word.dart';
import 'package:rus_bal_dict/core/network/models/dictionary/dictionary_models.dart';

part 'dictionary_service.g.dart';

@RestApi(baseUrl: '$testBaseUrl/dictionary')
abstract class DictionaryService {
  factory DictionaryService(Dio dio, {String? baseUrl}) = _DictionaryService;

  @POST('/add_word')
  Future<WordActionResponse> addWord(@Body() OnlyWordBody wordBody);

  @POST('/update_word')
  Future<WordActionResponse> updateWord(@Body() OnlyWordBody wordBody);

  @DELETE('/delete_word')
  Future<WordActionResponse> deleteWord(@Body() RemoveWordBody removeBody);

  @GET('/get_words')
  Future<List<Word>> getWords(@Query('name') String name,
      @Query('page') int page, @Query('size') int size);

  @GET('/words_count')
  Future<int> wordsCount(@Query('name') String name);

  @GET('/word_by_id')
  Future<Word> getWordById(@Query('id') int id);
}
