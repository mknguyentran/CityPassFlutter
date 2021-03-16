import 'package:animations/animations.dart';
import 'package:city_pass/models/activity.dart';
import 'package:city_pass/screens/activity_detail/activity_detail.dart';
import 'package:city_pass/screens/home/components/featured/components/activity_recommendation_card.dart';
import 'package:city_pass/shared/section_title.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActivityRecommendation extends StatelessWidget {
  const ActivityRecommendation(
      {Key key,
      @required this.title,
      @required this.children,
      this.hasPadding = true})
      : super(key: key);

  final String title;
  final List<Activity> children;
  final bool hasPadding;

  @override
  Widget build(BuildContext context) {
    List<Activity> _activityList = new List.from(children);
    _activityList.shuffle();
    return Column(
      children: [
        SectionTitle(
          title: title,
          hasPadding: hasPadding,
          showAllCallback: () {},
        ),
        VerticalSpacing(
          of: 20,
        ),
        SingleChildScrollView(
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.only(
                left: hasPadding ? getProportionateScreenWidth(20) : 0),
            child: Row(
              children: [
                ...List.generate(
                  _activityList.length,
                  (index) => Padding(
                    padding: EdgeInsets.only(
                      right: getProportionateScreenWidth(20),
                    ),
                    child: OpenContainer(
                      closedBuilder: (context, action) =>
                          ActivityRecommendationCard(
                        activity: _activityList[index],
                      ),
                      openBuilder: (context, action) => ActivityDetail(
                        activity: _activityList[index],
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
        ),
      ],
    );
  }
}
