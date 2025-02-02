import 'package:either_dart/either.dart';
import 'package:rus_bal_dict/feature/history/presentation/history.dart';

extension NetworkResultExtension<LEFT extends Exception, RIGHT>
    on Either<LEFT, RIGHT> {
  Future<Either<LEFT, RIGHT>> safeCall(Future<RIGHT> Function() action,
      {Talker? logger}) async {
    try {
      return Right(await action());
    } on LEFT catch (left, stack) {
      logger?.handle(left, stack, 'safe call error');
      return Left(left);
    }
  }
}

Future<Either<LEFT, RIGHT>> safeCall<LEFT extends Exception, RIGHT>(
    Future<RIGHT> Function() action,
    {Talker? logger}) async {
  try {
    return Right(await action());
  } on LEFT catch (left, stack) {
    logger?.handle(left, stack, 'safe call error');
    return Left(left);
  }
}
