import 'dart:math';
import 'dart:ui';

import 'package:city_pass/constants.dart';
import 'package:city_pass/models/ticketType.dart';
import 'package:city_pass/shared/info_tag.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/material.dart';

class ActivityRecommendationCard extends StatelessWidget {
  const ActivityRecommendationCard({
    Key key,
    @required this.activity,
  }) : 
  super(key: key);

  final TicketType activity;

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
            image: NetworkImage(activity.imageUrl ?? ''),
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
                          "${activity.city}",
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
                            Text(
                              "${Random().nextDouble()+4}",
                              style: TextStyle(
                                  fontSize: 14, color: starYellowColor),
                            ),
                          ],
                        ),
                       // if (activity.isNew)
                        if (Random().nextBool())
                          InfoTag(
                            "Mới",
                            backgroundColor: lightGreenBackgroundColor,
                            foregroundColor: Colors.green[800],
                          ),
                        //if (activity.isPopular)
                        if (Random().nextBool())
                          InfoTag(
                            "Phổ biến",
                            backgroundColor: orangeBackgroundColor,
                            foregroundColor: primaryDarkColor,
                          )
                      ],
                    ),
                  ],
                ),
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     if (activity.travelDistance != null &&
                //         activity.travelTime != null)
                //       Padding(
                //         padding: const EdgeInsets.only(top: 10),
                //         child: Text(
                //             "${activity.travelDistance}km • ${activity.travelTime} phút",style: TextStyle(color: subtitleTextColor),),
                //       )
                //   ],
                // )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
