import 'package:city_pass/constants.dart';
import 'package:city_pass/models/city.dart';
import 'package:city_pass/screens/home/components/featured/components/activity_recommendation.dart';
import 'package:city_pass/screens/home/components/featured/components/pass_recommendation.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/material.dart';
import 'components/attraction_category.dart';
import 'components/home_header.dart';

class Explore extends StatelessWidget {
  final City city;

  const Explore({Key key, this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var verticalSpacing = 60.0;
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
          PassRecommendation(),
          VerticalSpacing(
            of: verticalSpacing,
          ),
          ActivityRecommendation(),
          VerticalSpacing(
            of: verticalSpacing,
          ),
        ],
      ),
    );
  }
}
