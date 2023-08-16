import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

import 'similar_book_listview.dart';

class SectionSimilarListView extends StatelessWidget {
  const SectionSimilarListView({Key? key, required this.books})
      : super(key: key);
  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You can also like',
          style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 16,
        ),
        SimilarBooksListView(
          books: books,
        ),
      ],
    );
  }
}
