import 'dart:math';

import 'package:city_pass/constants.dart';
import 'package:city_pass/mockupData/mockup_activity.dart';
import 'package:city_pass/mockupData/mockup_pass.dart';
import 'package:city_pass/model/city.dart';

import 'package:city_pass/screens/home/components/featured/components/activity_recommendation.dart';
import 'package:city_pass/screens/home/components/featured/components/activity_recommendation_vertical.dart';
import 'package:city_pass/screens/home/components/featured/components/pass_recommendation.dart';
import 'package:city_pass/service/ticketType_services.dart';
import 'package:city_pass/models/ticketType.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/material.dart';
import 'components/attraction_category.dart';

class Explore extends StatefulWidget {
  final City city;

  Explore({Key key, this.city}) : super(key: key);

  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  Future<List<TicketType>> listRealActivitiesNearYou_3;
  // Future<TicketType> ticketTypeDetail;
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   listRealActivitiesNearYou_3 =
    //       await TicketTypeAPI().getAllTicketTypes(onError: (msg) {
    //     print("Mistake: " + msg);
    //   });
    // });
    listRealActivitiesNearYou_3 =
        TicketTypeAPI().getAllTicketTypes(onError: (msg) {
      print(msg);
    });
  }

  @override
  Widget build(BuildContext context) {
    var verticalSpacing = 60.0;
    // return FutureBuilder(
    //     future: listRealActivitiesNearYou_3,
    //     builder: (context, snapshot) {
    //       if (snapshot.hasData) {
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      child: Column(
        children: [
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: 20),
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [kDefaultShadow]),
              child: Image(
                image: AssetImage("assets/images/tiniworld.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          AttractionCategory(),
          VerticalSpacing(
            of: verticalSpacing,
          ),
          PassRecommendation(
            title: "Combo được yêu thích",
            children: mockupPasses,
          ),
          VerticalSpacing(
            of: verticalSpacing,
          ),
          PassRecommendation(
            title: "Deal tốt Tháng 3 🎉",
            subtitle: "Giảm đến 50% khi mua trong tháng này",
            children: mockupPasses,
          ),
          VerticalSpacing(
            of: verticalSpacing,
          ),
          FutureBuilder(
              future: listRealActivitiesNearYou_3,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ActivityRecommendation(
                    title: "Gần bạn nhất",
                    children: snapshot.data,
                  );
                }
                return CircularProgressIndicator();
              }),
          VerticalSpacing(
            of: verticalSpacing,
          ),
          // ActivityRecommendation(
          //   title: "Điểm đến nổi bật",
          //   children: listRealActivitiesNearYou_3,
          // ),
          // ActivityRecommendationVertical(
          //   children: List.generate(30, (index) {
          //     var ran = new Random();
          //     var ranInt = ran.nextInt(mockupActivities.length - 1);
          //     return mockupActivities[ranInt];
          //   }),
          // ),
          VerticalSpacing(
            of: verticalSpacing,
          ),
        ],
      ),
    );
    // }

    return CircularProgressIndicator();
    // });
  }
}
