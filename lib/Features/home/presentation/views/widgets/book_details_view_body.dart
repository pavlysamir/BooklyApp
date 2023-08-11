import 'package:flutter/material.dart';
import 'book_detials_section.dart';
import 'custom_bookdetails_app_bar.dart';
import 'similar_section_listview.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  CustomAppBarBookDetails(),
                  SectionBookDetailsView(),
                  SizedBox(
                    height: 50,
                  ),
                  SectionSimilarListView(),
                  SizedBox(
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
