import 'package:city_pass/constants.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key key,
    this.showAllCallback,
    @required this.title,
  }) : super(key: key);

  final String title;
  final GestureTapCallback showAllCallback;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(kDefaultPadding),
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
