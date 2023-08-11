import 'package:flutter/material.dart';
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
                  const SectionSimilarListView(),
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
