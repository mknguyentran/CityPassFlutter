import 'dart:math';

import 'package:city_pass/constants.dart';
import 'package:city_pass/models/city.dart';
import 'package:city_pass/models/pass.dart';
import 'package:city_pass/screens/home/components/explore/components/activity_recommendation_vertical.dart';
import 'package:city_pass/screens/home/components/search/search.dart';
import 'package:city_pass/service/ticketType_services.dart';
import 'package:city_pass/service/pass_services.dart';
import 'package:city_pass/models/ticketType.dart';

import 'package:city_pass/screens/home/components/explore/components/activity_recommendation.dart';

import 'package:city_pass/screens/home/components/explore/components/pass_recommendation.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/cupertino.dart';
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
  Future<List<Pass>> listPasses;

  @override
  Widget build(BuildContext context) {
    var verticalSpacing = 60.0;
    listRealActivitiesNearYou_3 =
        TicketTypeAPI().getAllTicketTypes(city: widget.city);
    listPasses = PassAPI().getAllPasses(city: widget.city);

    return SingleChildScrollView(
      clipBehavior: Clip.none,
      child: Column(
        children: [
          // Padding(
          //   padding:
          //       EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: 20),
          //   child: GestureDetector(
          //     onTap: () {
          //       Navigator.push(
          //         context,
          //         CupertinoPageRoute(
          //           builder: (context) {
          //             return ActivityDetail(
          //               activity: tiniWorld,
          //             );
          //           },
          //         ),
          //       );
          //     },
          //     child: Container(
          //       clipBehavior: Clip.hardEdge,
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(10),
          //           boxShadow: [kDefaultShadow]),
          //       child: Image(
          //         image: AssetImage("assets/images/tiniworld.png"),
          //         fit: BoxFit.fill,
          //       ),
          //     ),
          //   ),
          // ),
          Container(
            margin: EdgeInsets.all(kDefaultPadding),
            height: 40,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [kDefaultShadow],
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) {
                    return SearchPage(city: widget.city);
                  }),
                );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: kDefaultPadding, vertical: 12),
                child: Text(
                  'Tìm kiếm địa điểm',
                  style: TextStyle(fontSize: 12, color: primaryDarkColor),
                ),
              ),
            ),
          ),
          AttractionCategory(),
          VerticalSpacing(
            of: verticalSpacing,
          ),
          FutureBuilder(
            future: listPasses,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print(snapshot.data.length);
                return Column(
                  children: [
                    PassRecommendation(
                      title: "Combo được yêu thích",
                      children: snapshot.data,
                    ),
                    VerticalSpacing(
                      of: verticalSpacing,
                    ),
                    PassRecommendation(
                      title: "Deal tốt Tháng 3 🎉",
                      subtitle: "Giảm đến 50% khi mua trong tháng này",
                      children: snapshot.data,
                    ),
                    VerticalSpacing(
                      of: verticalSpacing,
                    ),
                  ],
                );
              }
              return Center(
                  child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(primaryLightColor),
              ));
            },
          ),
          FutureBuilder(
              future: listRealActivitiesNearYou_3,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      ActivityRecommendation(
                        title: "Gần bạn nhất",
                        children: snapshot.data,
                      ),
                      VerticalSpacing(
                        of: verticalSpacing,
                      ),
                      ActivityRecommendation(
                        title: "Điểm đến nổi bật",
                        children: snapshot.data,
                      ),
                      ActivityRecommendationVertical(
                        children: List.generate(30, (index) {
                          var ran = new Random();
                          var ranInt = ran.nextInt(snapshot.data.length - 1);
                          return snapshot.data[ranInt];
                        }),
                      ),
                      VerticalSpacing(
                        of: verticalSpacing,
                      ),
                    ],
                  );
                }
                return Container();
              }),
        ],
      ),
    );
  }
}
