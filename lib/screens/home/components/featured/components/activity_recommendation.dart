import 'package:animations/animations.dart';
import 'package:city_pass/models/activity.dart';
import 'package:city_pass/screens/activity_detail/activity_detail.dart';
import 'package:city_pass/screens/home/components/featured/components/activity_recommendation_card.dart';
import 'package:city_pass/shared/section_title.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActivityRecommendation extends StatelessWidget {
  const ActivityRecommendation({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: "Điểm đến nổi bật",
          hasPadding: true,
          showAllCallback: () {},
        ),
        VerticalSpacing(
          of: 20,
        ),
        SingleChildScrollView(
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                mockupActivities.length,
                (index) => Padding(
                  padding:
                      EdgeInsets.only(left: getProportionateScreenWidth(20)),
                  child: OpenContainer(
                    closedBuilder: (context, action) => ActivityRecommendationCard(
                      activity: mockupActivities[index],
                    ),
                    openBuilder: (context, action) => ActivityDetail(
                      activity: mockupActivities[index],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(20),
              )
            ],
          ),
        ),
      ],
    );
  }
}
