import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key key,
    this.width = 300,
    this.height = 50,
    this.hintText,
    this.boxShadow,
  }) : super(key: key);

  final double width, height;
  final String hintText;
  final List<BoxShadow> boxShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: boxShadow,
      ),
      child: TextField(
        onChanged: (value) {},
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
              fontSize: 12,
              color: primaryDarkColor,),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          suffixIcon: Icon(
            Icons.search,
            color: primaryDarkColor,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
            vertical: height/4
          ),
        ),
      ),
    );
  }
}
