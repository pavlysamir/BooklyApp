import 'package:flutter/material.dart';

class CustomImageLoadingIndicator extends StatelessWidget {
  const CustomImageLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 2.6 / 4,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(18)),
          child: Container(
            color: Colors.grey,
          ),
        ));
  }
}
