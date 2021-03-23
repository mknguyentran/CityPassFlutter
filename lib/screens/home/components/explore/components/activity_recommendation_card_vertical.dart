import 'dart:ui';

import 'package:city_pass/constants.dart';
import 'package:city_pass/model/activity.dart';
import 'package:city_pass/models/ticketType.dart';
import 'package:city_pass/shared/info_tag.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/material.dart';

class ActivityRecommendationCardVertical extends StatelessWidget {
  const ActivityRecommendationCardVertical({
    Key key,
    @required this.activity,
  }) : super(key: key);

  //final Activity activity;
  final TicketType activity;

  @override
  Widget build(BuildContext context) {
    var _cardheight = 150.0;
    return Container(
      padding: EdgeInsets.all(10),
      clipBehavior: Clip.hardEdge,
      height: _cardheight,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: BorderSide(
            color: fadedTextColor,
            width: 0.5,
          ))),
      child: Row(children: [
        Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            image: DecorationImage(
              image: AssetImage(activity.imageUrl ?? ''),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(left: 10),
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
                          "${activity.city}",
                          style: TextStyle(color: subtitleTextColor),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    VerticalSpacing(of: 5),
                    Text(
                      activity.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    VerticalSpacing(of: 5),
                    Wrap(
                      spacing: 10,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.star_rounded,
                              size: 16,
                              color: starYellowColor,
                            ),
                            // Text(
                            //   activity.overallRating.toString(),
                            //   style: TextStyle(
                            //       fontSize: 14, color: starYellowColor),
                            // ),
                          ],
                        ),
                        //if (activity.isNew)
                        if (true)
                          InfoTag(
                            "Mới",
                            backgroundColor: lightGreenBackgroundColor,
                            foregroundColor: Colors.green[800],
                          ),
                        if (true)
                          InfoTag(
                            "Phổ biến",
                            backgroundColor: orangeBackgroundColor,
                            foregroundColor: primaryDarkColor,
                          )
                      ],
                    ),
                  ],
                ),
                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         if (activity.travelDistance != null &&
                //             activity.travelTime != null)
                //           Padding(
                //             padding: const EdgeInsets.only(top: 10),
                //             child: Text(
                //               "${activity.travelDistance}km • ${activity.travelTime} phút",
                //               style: TextStyle(color: subtitleTextColor),
                //             ),
                //           )
                //       ],
                //     )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
