import 'package:bookly_app/Features/home/data/repo_data_sources/home_local_data_source.dart';
import 'package:bookly_app/Features/home/data/repo_data_sources/home_remote_data_source.dart';
import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';

import 'package:bookly_app/core/errors/failure.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repos/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  HomeRemoteDataSource homeRemoteDataSource;
  HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl(
      {required this.homeRemoteDataSource, required this.homeLocalDataSource});
  @override
  Future<Either<Failuer, List<BookEntity>>> fetchFeatureBooks() async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.fetchFeatureBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchFeatureBooks();
      return right(books);
    } on Exception catch (e) {
      return left(Failuer());
    }
  }

  @override
  Future<Either<Failuer, List<BookEntity>>> fetchNewsBooks() async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.fetchNewsBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchNewsBooks();
      return right(books);
    } on Exception catch (e) {
      return left(Failuer());
    }
  }
}
