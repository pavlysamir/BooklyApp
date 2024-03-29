part of 'featured_books_cubit.dart';

@immutable
abstract class FeaturedBooksState {}

class FeaturedBooksInitial extends FeaturedBooksState {}

class FeaturedBooksLoading extends FeaturedBooksState {}

class FeaturedBooksPaginationLoading extends FeaturedBooksState {}

class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<BookEntity> books;

  FeaturedBooksSuccess(this.books);
}

class FeaturedBooksFailure extends FeaturedBooksState {
  final String messageError;

  FeaturedBooksFailure(this.messageError);
}

class FeaturedBooksPaginationFailure extends FeaturedBooksState {
  final String messageError;

  FeaturedBooksPaginationFailure(this.messageError);
}
