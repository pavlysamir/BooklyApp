import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
class CustomBookImage extends StatelessWidget {
  const CustomBookImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6/4,
      child: Container(
          decoration:  BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(16),
            image: const DecorationImage(
                image: AssetImage(AssetsData.test1),
                fit: BoxFit.fill
            ),
          )
      ),
    );
  }
}