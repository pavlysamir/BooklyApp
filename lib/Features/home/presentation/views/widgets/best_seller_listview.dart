import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

import 'best_seller_listview_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({Key? key, required this.books}) : super(key: key);
  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: books.length,
        itemBuilder: (context, index) {
          return BestsellerListViewItem(
            author: books[index].authorName ?? 'UnKnown',
            image: books[index].image ?? '',
            price: books[index].price ?? 0,
            rating: books[index].rating,
            title: books[index].title,
          );
        });
  }
}
