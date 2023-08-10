import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
    required this.backGroundColor,
    required this.textColor,
    this.borderRadius,
  }) : super(key: key);

  final String text;
  final Color backGroundColor;
  final Color textColor;
  final Function() onTap;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 19),
        //width: MediaQuery.of(context).size.width *0.4,
        decoration: BoxDecoration(
            borderRadius: borderRadius ??
                const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
            color: backGroundColor),

        child: Text(
          text,
          textAlign: TextAlign.center,
          style: Styles.textStyle16.copyWith(
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
