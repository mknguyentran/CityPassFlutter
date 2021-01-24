import 'package:CityPass/constants.dart';
import 'package:CityPass/screens/home/components/recommendation.dart';
import 'package:CityPass/shared/section_title.dart';
import 'package:CityPass/size_config.dart';
import 'package:flutter/material.dart';
import 'attraction_category.dart';
import 'home_header.dart';

class Body extends StatelessWidget {
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

