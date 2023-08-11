import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

import 'custom_book_item.dart';

class FeaturedListView extends StatelessWidget {
  const FeaturedListView({Key? key, required this.books}) : super(key: key);
  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: books.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: CustomBookImage(image: books[index].image ?? ''));
          }),
    );
  }
}
