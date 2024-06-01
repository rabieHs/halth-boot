import 'package:dartz/dartz.dart';

import '../../error/failure.dart';

abstract class BaseUsecase<T, P> {
  Future<Either<Failure, T>> call(P parameter);
}
