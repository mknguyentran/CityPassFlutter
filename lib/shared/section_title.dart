import 'package:city_pass/constants.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key key,
    this.showAllCallback,
    this.hasPadding = false,
    @required this.title,
    this.lineSpacing = 0,
  }) : super(key: key);

  final bool hasPadding;
  final String title;
  final GestureTapCallback showAllCallback;
  final double lineSpacing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal:
            hasPadding ? getProportionateScreenWidth(kDefaultPadding) : 0,
        vertical: lineSpacing,
      ),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          if (showAllCallback != null)
            GestureDetector(
              onTap: showAllCallback,
              child: Text('Xem tất cả'),
            )
        ],
      ),
    );
  }
}
