import 'package:bookly_app/core/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CustomPriceBookDetails extends StatelessWidget {
  const CustomPriceBookDetails({Key? key, required this.price})
      : super(key: key);
  final num price;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: CustomButton(
            onTap: () {},
            text: '$price€',
            backGroundColor: Colors.white,
            textColor: Colors.black,
          ),
        ),
        Expanded(
          child: CustomButton(
            onTap: () {},
            text: 'Free preview',
            backGroundColor: const Color(0xffEF8262),
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12)),
            textColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
