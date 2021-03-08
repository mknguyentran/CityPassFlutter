import 'package:city_pass/constants.dart';
import 'package:city_pass/models/activity.dart';
import 'package:city_pass/shared/info_tag.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/material.dart';

class ActivityRecommendationCard extends StatelessWidget {
  const ActivityRecommendationCard({
    Key key,
    @required this.activity,
  }) : super(key: key);

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    var _cardWidth = 250.0;
    var _cardheight = 350.0;
    return Container(
      clipBehavior: Clip.hardEdge,
      width: _cardWidth,
      height: _cardheight,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [kDefaultShadow],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(children: [
        Container(
          height: 180,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(activity.image),
            fit: BoxFit.cover,
          )),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "aaa • bbb địa điểm",
                          style: TextStyle(color: subtitleTextColor),
                        ),
                      ],
                    ),
                    VerticalSpacing(of: 5),
                    Text(
                      activity.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    VerticalSpacing(of: 5),
                    Row(
                      children: [
                        Icon(
                          Icons.star_rounded,
                          size: 16,
                          color: starYellowColor,
                        ),
                        Text(
                          "abc",
                          style:
                              TextStyle(fontSize: 14, color: starYellowColor),
                        )
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "abc",
                      style: TextStyle(
                        color: fadedTextColor,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    VerticalSpacing(of: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "abc",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "abc",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: primaryLightColor),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
