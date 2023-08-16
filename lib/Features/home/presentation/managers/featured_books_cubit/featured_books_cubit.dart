import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Features/home/domain/usecases/fetch_feature_books_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.featureBooksUseCase) : super(FeaturedBooksInitial());

  FetchFeatureBooksUseCase featureBooksUseCase;

  Future<void> fetchFeaturedBooks({int pageNum = 0}) async {
    if (pageNum == 0) {
      emit(FeaturedBooksLoading());
    } else {
      emit(FeaturedBooksPaginationLoading());
    }
    var result = await featureBooksUseCase.call(pageNum);
    result.fold((failure) {
      if (pageNum == 0) {
        emit(FeaturedBooksFailure(failure.messege));
      } else {
        emit(FeaturedBooksPaginationFailure(failure.messege));
      }
    }, (books) {
      emit(FeaturedBooksSuccess(books));
    });
  }
}
