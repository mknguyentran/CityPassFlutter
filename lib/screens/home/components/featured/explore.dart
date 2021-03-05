import 'package:city_pass/models/city.dart';
import 'package:city_pass/screens/home/components/featured/components/recommendation.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/material.dart';
import 'components/attraction_category.dart';
import 'components/home_header.dart';

class Explore extends StatelessWidget {
  final City city;

  const Explore({Key key, this.city}) : super(key: key);

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
          AttractionCategory(),
          VerticalSpacing(
            of: 35,
          ),
          RecommendationCards(),
        ],
      ),
    );
  }
}
