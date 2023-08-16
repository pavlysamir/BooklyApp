import 'package:bookly_app/Features/home/presentation/managers/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/book_entity.dart';
import 'book_detials_section.dart';
import 'custom_bookdetails_app_bar.dart';
import 'similar_section_listview.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({
    Key? key,
    required this.bookEntity,
  }) : super(key: key);
  final BookEntity bookEntity;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  const CustomAppBarBookDetails(),
                  SectionBookDetailsView(bookEntity: bookEntity),
                  const SizedBox(
                    height: 50,
                  ),
                  const SimilarListViewBlocBuilder(),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class SimilarListViewBlocBuilder extends StatelessWidget {
  const SimilarListViewBlocBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SectionSimilarListView(
            bookEntity: state.books,
          );
        } else if (state is FeaturedBooksFailure) {
          return Text(state.messageError);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
