import 'package:animations/animations.dart';
import 'package:city_pass/models/activity.dart';
import 'package:city_pass/models/pass.dart';
import 'package:city_pass/screens/activity_detail/activity_detail.dart';
import 'package:city_pass/screens/home/components/featured/components/activity_recommendation_card.dart';
import 'package:city_pass/screens/home/components/featured/components/pass_recommendation_card.dart';
import 'package:city_pass/screens/pass_detail/pass_detail.dart';
import 'package:city_pass/shared/section_title.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PassRecommendation extends StatelessWidget {
  const PassRecommendation({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: "CityPass được yêu thích",
          hasPadding: true,
          showAllCallback: () {},
        ),
        VerticalSpacing(
          of: 20,
        ),
        SingleChildScrollView(
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                mockupPasses.length,
                (index) => Padding(
                  padding:
                      EdgeInsets.only(left: getProportionateScreenWidth(20)),
                  child: OpenContainer(
                    closedElevation: 1,
                    closedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    closedBuilder: (context, action) => PassRecommendationCard(
                      pass: mockupPasses[index],
                    ),
                    openBuilder: (context, action) => PassDetail(
                      pass: mockupPasses[index],
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
