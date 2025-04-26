import 'package:either_dart/either.dart';
import 'package:rus_bal_dict/core/model/word/suggest_word.dart';
import 'package:rus_bal_dict/core/network/api/suggest/suggests_service.dart';
import 'package:rus_bal_dict/core/network/models/suggest/suggest_models.dart';
import 'package:rus_bal_dict/core/secure_storage/token/token_secure_storage.dart';
import 'package:rus_bal_dict/feature/profile/domain/repository/new_suggest_repository.dart';
import 'package:talker/talker.dart';

class NewSuggestRepositoryImpl implements NewSuggestRepository {
  final SuggestsService suggestsService;
  final TokenSecureStorage _tokenStorage = TokenSecureStorage();
  final Talker? logger;

  NewSuggestRepositoryImpl({required this.suggestsService, this.logger});

  @override
  Future<Either<Exception, List<SuggestWord>>> getSuggestWords(
      String name, int page, int size) async {
    try {
      final token = await _tokenStorage.get();
      final userSuggests = await suggestsService.getUserSuggestWords(
          'Bearer ${token.accessToken}', name, page, size);
      return Right(userSuggests);
    } on Exception catch (e, s) {
      logger?.handle(e, s, 'suggest repo error');
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, SuggestResponse>> suggest(
      String word, String meaning) async {
    try {
      final token = await _tokenStorage.get();
      final suggestResponse = await suggestsService.suggest(
          'Bearer ${token.accessToken}', word, meaning);
      return Right(suggestResponse);
    } on Exception catch (e, s) {
      logger?.handle(e, s, 'suggest repo error');
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, int>> suggestsCount(String name) async {
    try {
      final token = await _tokenStorage.get();
      final count = await suggestsService.getUserSuggestsWordsCount(
          'Bearer ${token.accessToken}', name);
      return Right(count);
    } on Exception catch (e, s) {
      logger?.handle(e, s, 'suggest repo error');
      return Left(e);
    }
  }
}
