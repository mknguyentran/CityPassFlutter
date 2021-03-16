import 'package:animations/animations.dart';
import 'package:city_pass/constants.dart';
import 'package:city_pass/models/activity.dart';
import 'package:city_pass/screens/activity_detail/activity_detail.dart';
import 'package:city_pass/screens/home/components/featured/components/activity_recommendation_card.dart';
import 'package:city_pass/screens/home/components/featured/components/activity_recommendation_card_vertical.dart';
import 'package:city_pass/shared/section_title.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActivityRecommendationVertical extends StatelessWidget {
  const ActivityRecommendationVertical({
    Key key,
    this.title,
    @required this.children,
  }) : super(key: key);

  final String title;
  final List<Activity> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (title != null)
          SectionTitle(
            title: title,
            hasPadding: true,
            showAllCallback: () {},
          ),
        VerticalSpacing(
          of: 20,
        ),
        SingleChildScrollView(
          clipBehavior: Clip.none,
          child: Column(
            children: [
              ...List.generate(
                children.length,
                (index) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: OpenContainer(
                    closedElevation: 0,
                    closedShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0)),
                    closedBuilder: (context, action) =>
                        ActivityRecommendationCardVertical(
                      activity: children[index],
                    ),
                    openBuilder: (context, action) => ActivityDetail(
                      activity: children[index],
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
