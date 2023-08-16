import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({Key? key, required this.image}) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 2.6 / 4,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(18)),
          child: InkWell(
            onTap: () {
              GoRouter.of(context).push(
                AppRouter.kBookDetails,
              );
            },
            child: CachedNetworkImage(
              imageUrl: image,
              fit: BoxFit.fill,
            ),
          ),
        ));
  }
}
