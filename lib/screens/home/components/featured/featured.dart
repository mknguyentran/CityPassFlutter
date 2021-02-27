import 'package:city_pass/screens/home/components/featured/recommendation.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/material.dart';
import '../featured/attraction_category.dart';
import '../home_header.dart';

class Featured extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      child: Column(
        children: [
          HomeHeader(),
          VerticalSpacing(
            of: 50,
          ),
          RecommendationCards(),
          VerticalSpacing(
            of: 35,
          ),
          AttractionCategory(),
        ],
      ),
    );
  }
}
