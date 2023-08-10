import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

import 'similar_book_listview.dart';

class SectionSimilarListView extends StatelessWidget {
  const SectionSimilarListView({Key? key}) : super(key: key);

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
        const SimilarBooksListView(),
      ],
    );
  }
}
