import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:rus_bal_dict/core/model/word/suggest_word.dart';
import 'package:rus_bal_dict/core/network/models/suggest/suggest_models.dart';
import 'package:rus_bal_dict/core/constants/private.dart';

part 'suggests_service.g.dart';

@RestApi(baseUrl: '$testBaseUrl/suggestion')
abstract class SuggestsService {
  factory SuggestsService(Dio dio, {String? baseUrl}) = _SuggestsService;

  @POST('/suggest_word')
  Future<SuggestResponse> suggest(
      @Header('Authorization') authHeader, CreateSuggestBody body);

  @POST('/accept_suggest')
  Future<SuggestAcceptResponse> accept(@Field('suggest_id') int suggestId);

  @POST('/reject_suggest')
  Future<SuggestRejectResponse> reject(@Field('suggest_id') int suggestId);

  @POST('/get_suggest_words')
  Future<List<SuggestWord>> getUserSuggestWords(
      @Header('Authorization') authHeader,
      @Field('name') String name,
      @Field('page') int page,
      @Field('size') int size);

  @POST('/suggests_count')
  Future<int> getUserSuggestsWordsCount(
      @Header('Authorization') authHeader, @Field('name') String name);
}
