import 'package:flutter/material.dart';

import '../constants.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key key,
    this.width = 300,
    this.height = 50,
    this.hintText,
    this.boxShadow,
    this.onChange,
    this.onTap,
    this.onSubmit,
  }) : super(key: key);

  final double width, height;
  final String hintText;
  final List<BoxShadow> boxShadow;
  final void Function(String) onChange;
  final void Function() onTap;
  final void Function(String) onSubmit;

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
        onChanged: this.onChange,
        onTap: this.onTap,
        onSubmitted: this.onSubmit,
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
