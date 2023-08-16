import 'package:dartz/dartz.dart';

import '../errors/failure.dart';

abstract class UseCase<entity, Param> {
  Future<Either<Failuer, entity>> call([Param param]);
}

class NoParam {}
