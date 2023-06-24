import 'package:dartz/dartz.dart';

import '../errors/failure.dart';

abstract class UseCase<entity> {
  Future<Either<Failuer, entity>> call();
}
