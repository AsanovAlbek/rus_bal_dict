import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:rus_bal_dict/core/model/word/word.dart';
import 'package:rus_bal_dict/core/network/models/dictionary/dictionary_models.dart';

part 'dictionary_service.g.dart';

@RestApi()
abstract class DictionaryService {
  factory DictionaryService(Dio dio, {String? baseUrl}) = _DictionaryService;

  @POST('/dictionary/add_word')
  Future<WordActionResponse> addWord(@Body() OnlyWordBody wordBody);

  @POST('/dictionary/update_word')
  Future<WordActionResponse> updateWord(@Body() OnlyWordBody wordBody);

  @DELETE('/dictionary/delete_word')
  Future<WordActionResponse> deleteWord(@Body() RemoveWordBody removeBody);

  @GET('/dictionary/get_words')
  Future<List<Word>> getWords(@Query('name') String name,
      @Query('page') int page, @Query('size') int size);

  @GET('/dictionary/words_count')
  Future<int> wordsCount(@Query('name') String name);

  @GET('/dictionary/word_by_id')
  Future<Word> getWordById(@Query('id') int id);
}
