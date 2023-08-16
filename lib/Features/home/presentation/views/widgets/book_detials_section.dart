import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

import 'book_rating.dart';
import 'custom_book_item.dart';
import 'custom_price_bookdetails.dart';

class SectionBookDetailsView extends StatelessWidget {
  const SectionBookDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.2),
          child: const CustomBookImage(
            image: '',
          ),
        ),
        const SizedBox(
          height: 34,
        ),
        const Text(
          ' bookEntity.title',
          style: Styles.textStyle30,
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: 0.7,
          child: Text(
            'UnKown',
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
              color: const Color(0xffFFFFFF),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const BookRating(
          rating: 5,
        ),
        const SizedBox(
          height: 35,
        ),
        const CustomPriceBookDetails(
          price: 100,
        ),
      ],
    );
  }
}
