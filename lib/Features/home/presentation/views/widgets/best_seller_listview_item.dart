import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../constants.dart';
import 'book_rating.dart';

class BestsellerListViewItem extends StatelessWidget {
  const BestsellerListViewItem({
    Key? key,
    required this.image,
    required this.title,
    required this.author,
    required this.rating,
    required this.price,
  }) : super(key: key);
  final String image;
  final String title;
  final String author;
  final num rating;
  final num price;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetails);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: SizedBox(
          height: 125,
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 2.5 / 4,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  child: CachedNetworkImage(
                    imageUrl: image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .5,
                      child: Text(
                        title,
                        style: Styles.textStyle20
                            .copyWith(fontFamily: kGtsectraFine),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      author,
                      style: Styles.textStyle14.copyWith(
                        color: const Color(0xff707070),
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: [
                        Text(
                          '$price €',
                          style: Styles.textStyle20
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        BookRating(
                          rating: rating,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
