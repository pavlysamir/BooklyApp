import '../../domain/entities/book_entity.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  @override
  Future<List<BookEntity>> fetchFeatureBooks() {
    // TODO: implement fetchFeatureBooks
    throw UnimplementedError();
  }

  @override
  Future<List<BookEntity>> fetchNewsBooks() {
    // TODO: implement fetchNewsBooks
    throw UnimplementedError();
  }
}

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeatureBooks();
  Future<List<BookEntity>> fetchNewsBooks();
}
