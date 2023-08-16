import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Features/home/domain/usecases/fetch_feature_newest_books_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.fetchNewestFeatureBooksUseCase)
      : super(NewestBooksInitial());

  FetchNewestFeatureBooksUseCase fetchNewestFeatureBooksUseCase;

  Future<void> fetchNewestdBooks({int pageNum = 0}) async {
    emit(NewestBooksLoading());
    var result = await fetchNewestFeatureBooksUseCase.call(pageNum);
    result.fold((failure) {
      emit(NewestBooksFailure(failure.messege));
    }, (books) {
      emit(NewestBooksSuccess(books));
    });
  }
}
