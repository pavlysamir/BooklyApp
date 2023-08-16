import 'package:bookly_app/Features/home/presentation/views/widgets/custom_book_image_loading_indicator.dart';
import 'package:bookly_app/core/utils/widgets/custom_fading_widget.dart';
import 'package:flutter/material.dart';

class ListViewFeaturedLoadingIndecator extends StatelessWidget {
  const ListViewFeaturedLoadingIndecator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 15,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: CustomImageLoadingIndicator(),
            );
          },
        ),
      ),
    );
    ;
  }
}
