import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/assets.dart';
import 'book_rating.dart';
class BestsellerListViewItem extends StatelessWidget {
  const BestsellerListViewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        GoRouter.of(context).push(AppRouter.kBookDetails);
      },
        child: Padding(
          padding:const EdgeInsets.only(bottom: 20),
          child: SizedBox(
            height: 125,
            child: Row(
              children: [
                AspectRatio(
                  aspectRatio: 2.5 / 4,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.red,
                      image: const DecorationImage(
                          image: AssetImage(AssetsData.test1), fit: BoxFit.fill),
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
                          'Harry Potter and the Goblet of Fire',
                          style: Styles.textStyle20.copyWith(fontFamily: kGtsectraFine),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        'J.K. Rowling',
                        style: Styles.textStyle14.copyWith(
                          color: Color(0xff707070),
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                    Row(
                      children: [
                        Text('19.99 €',
                          style: Styles.textStyle20.copyWith(
                              fontWeight: FontWeight.bold),
                        ),
                       const Spacer(),
                        const BookRating(),

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

