import 'package:city_pass/models/activity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActivityImages extends StatelessWidget {
  final Activity activity;

  const ActivityImages({Key key, @required this.activity})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
          activity.moreImages.length,
          (index) => Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: SizedBox(
              width: 400,
              child: Image.asset(activity.moreImages[index]),
            ),
          ),
        )
      ],
    );
  }
}
