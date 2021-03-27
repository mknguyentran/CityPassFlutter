import 'package:city_pass/constants.dart';
import 'dart:math';
import 'package:city_pass/mockupData/mockup_activity.dart';
import 'package:city_pass/model/activity.dart';
import 'package:city_pass/models/city.dart';
import 'package:city_pass/screens/activity_detail/activity_detail.dart';
import 'package:city_pass/service/ticketType_services.dart';
import 'package:city_pass/models/ticketType.dart';
import 'package:city_pass/screens/home/components/explore/components/activity_recommendation_vertical.dart';
import 'package:city_pass/shared/section_title.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Locations extends StatefulWidget {
  final City city;

  const Locations({Key key, this.city}) : super(key: key);

  @override
  _LocationsState createState() => _LocationsState();
}

class _LocationsState extends State<Locations> {
  Future<List<TicketType>> listNearYouActivities;

  @override
  Widget build(BuildContext context) {
    List<TicketType> _favoriteList;
    listNearYouActivities =
        TicketTypeAPI().getAllTicketTypes(city: widget.city);

    // void convertList() async {
    //   _favoriteList = await Future.value(listNearYouActivities);
    // }

    // convertList();

    // _favoriteList.shuffle();
    // _favoriteList = _favoriteList.sublist(0, 4);
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding, vertical: 10),
          child: FutureBuilder(
            future: listNearYouActivities,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // var rng = new Random();
                // int ranInt =  rng.nextInt(snapshot.data.length - 1 - 4);
                // _favoriteList = snapshot.data.sublist(ranInt,ranInt + 4);
                return Column(
                  children: [
                    // TopDestinations(activityList: _favoriteList),
                    // VerticalSpacing(
                    //   of: 60,
                    // ),
                    ActivityRecommendationVertical(
                      hasPadding: false,
                      title: "",
                      children: snapshot.data,
                    ),
                  ],
                );
              } else {
                return Container(
                  height: percentageOfScreenHeight(20),
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(primaryLightColor),
                  ),
                );
              }
            },
          )),
    );
  }
}

class TopDestinations extends StatelessWidget {
  const TopDestinations({
    Key key,
    @required this.activityList,
  })  : assert(activityList.length == 4),
        super(key: key);

  final List<TicketType> activityList;

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

  // final Activity activity;
  final TicketType activity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) {
              return ActivityDetail(
                ticketTypeID: activity.id,
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
                image: NetworkImage(activity.imageUrl ?? ''),
                fit: BoxFit.cover)),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Text(
              activity.name,
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
