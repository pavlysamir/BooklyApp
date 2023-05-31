import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          enabledBorder: outlineInputBorder(),
          focusedBorder: outlineInputBorder(),
          hintText: 'Search',
          suffixIcon:const Opacity(
            opacity: 0.8,
            child: Icon(FontAwesomeIcons.magnifyingGlass,
              size: 24,),
          )),
    );
  }


}


OutlineInputBorder outlineInputBorder(){
  return OutlineInputBorder(
    borderSide:const BorderSide(
        color: Colors.white
    ),
    borderRadius: BorderRadius.circular(12),
  );
}