import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failuer, List<BookEntity>>> fetchFeatureBooks(
      {int pageNum = 0});
  Future<Either<Failuer, List<BookEntity>>> fetchNewsBooks({int pageNum = 0});
}
