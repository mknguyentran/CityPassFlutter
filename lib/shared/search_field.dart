import 'package:city_pass/screens/search_result/search_result.dart';
import 'package:flutter/cupertino.dart';
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
    this.isButton = true,
    this.onSubmitted,
  }) : super(key: key);

  final double width, height;
  final String hintText;
  final List<BoxShadow> boxShadow;
  final void Function(String) onChange;
  final void Function() onTap;
  final bool isButton;
  final Function(String) onSubmitted;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isButton) {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) {
                return SearchResult();
              },
            ),
          );
        }
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: boxShadow,
        ),
        child: TextField(
          enabled: !isButton,
          autofocus: !isButton,
          onSubmitted: onSubmitted,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 12,
              color: primaryDarkColor,
            ),
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
              vertical: height / 4,
            ),
          ),
        ),
      ),
    );
  }
}
