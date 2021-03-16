import 'package:city_pass/constants.dart';
import 'package:city_pass/mockupData/mockup_activity.dart';
import 'package:city_pass/models/activity.dart';
import 'package:city_pass/models/city.dart';
import 'package:city_pass/screens/activity_detail/activity_detail.dart';
import 'package:city_pass/screens/home/components/explore/components/activity_recommendation_vertical.dart';
import 'package:city_pass/shared/section_title.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Locations extends StatelessWidget {
  final City city;

  const Locations({Key key, this.city}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Activity> _favoriteList = new List.from(mockupActivities);
    _favoriteList.shuffle();
    _favoriteList = _favoriteList.sublist(0, 4);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: 10),
        child: Column(
          children: [
            TopDestinations(activityList: _favoriteList),
            VerticalSpacing(of: 60,),
            ActivityRecommendationVertical(
              hasPadding: false,
              title: "Gần bạn nhất",
              children: mockupNearYouActivities_3,
            ),
          ],
        ),
      ),
    );
  }
}

class TopDestinations extends StatelessWidget {
  const TopDestinations({
    Key key,
    @required this.activityList,
  })  : assert(activityList.length == 4),
        super(key: key);

  final List<Activity> activityList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: "Điểm đến được yêu thích",
          lineSpacing: 20,
        ),
        Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 10,
                  child: TopDestinationCard(activity: activityList[0]),
                ),
                Expanded(
                  flex: 1,
                  child: VerticalDivider(),
                ),
                Expanded(
                  flex: 10,
                  child: TopDestinationCard(activity: activityList[1]),
                ),
              ],
            ),
            Divider(
              color: Colors.transparent,
            ),
            Row(
              children: [
                Expanded(
                  flex: 10,
                  child: TopDestinationCard(activity: activityList[2]),
                ),
                Expanded(
                  flex: 1,
                  child: VerticalDivider(),
                ),
                Expanded(
                  flex: 10,
                  child: TopDestinationCard(activity: activityList[3]),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class TopDestinationCard extends StatelessWidget {
  const TopDestinationCard({
    Key key,
    @required this.activity,
  }) : super(key: key);

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) {
              return ActivityDetail(
                activity: activity,
              );
            },
          ),
        );
      },
      child: Container(
        alignment: Alignment.bottomLeft,
        height: getProportionateScreenHeight(120),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: AssetImage(activity.image), fit: BoxFit.cover)),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Text(
              activity.getShortName,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
