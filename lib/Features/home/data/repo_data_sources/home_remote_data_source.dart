import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/api_services.dart';
import '../../../../core/functions/save_box.dart';
import '../../domain/entities/book_entity.dart';
import '../models/book_model/book_Model.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiServices apiServices;

  HomeRemoteDataSourceImpl(this.apiServices);
  @override
  Future<List<BookEntity>> fetchFeatureBooks() async {
    var data = await apiServices.get(
        endPoint: 'volumes?Filtering=free-ebooks&q=computer science');

    List<BookEntity> books = getBooksList(data);

    saveBooksData(books, kFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewsBooks() async {
    var data = await apiServices.get(
        endPoint:
            'volumes?Filtering=free-ebooks&Sorting=newest&q=computer science');
    List<BookEntity> newsBooks = getBooksList(data);

    saveBooksData(newsBooks, kNewsBox);
    return newsBooks;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data['items']) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }
}

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeatureBooks();
  Future<List<BookEntity>> fetchNewsBooks();
}
