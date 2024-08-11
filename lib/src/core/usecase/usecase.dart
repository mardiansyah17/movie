import 'package:dartz/dartz.dart';
import 'package:movie/src/core/errors/failures.dart';

abstract interface class UseCase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}

class NoParams {}
