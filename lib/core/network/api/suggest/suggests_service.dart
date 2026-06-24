import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:rus_bal_dict/core/model/word/suggest_word.dart';
import 'package:rus_bal_dict/core/network/models/suggest/suggest_models.dart';

part 'suggests_service.g.dart';

@RestApi()
abstract class SuggestsService {
  factory SuggestsService(Dio dio, {String? baseUrl}) = _SuggestsService;

  @POST('/suggestion/suggest_word')
  Future<SuggestResponse> suggest(
      @Header('Authorization') authHeader, @Field() String word, @Field() String meaning);

  @POST('/suggestion/accept_suggest')
  Future<SuggestAcceptResponse> accept(@Field('suggest_id') int suggestId);

  @POST('/suggestion/reject_suggest')
  Future<SuggestRejectResponse> reject(@Field('suggest_id') int suggestId);

  @POST('/suggestion/get_suggest_words')
  Future<List<SuggestWord>> getUserSuggestWords(
      @Header('Authorization') authHeader,
      @Field('name') String name,
      @Field('page') int page,
      @Field('size') int size);

  @POST('/suggestion/suggests_count')
  Future<int> getUserSuggestsWordsCount(
      @Header('Authorization') authHeader, @Field('name') String name);
}
