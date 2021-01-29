import 'package:CityPass/models/activity.dart';
import 'package:CityPass/screens/activity_detail/activity_detail.dart';
import 'package:CityPass/screens/home/components/recommendation_card.dart';
import 'package:CityPass/shared/section_title.dart';
import 'package:CityPass/size_config.dart';
import 'package:flutter/material.dart';

class RecommendationCards extends StatelessWidget {
  const RecommendationCards({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: "CityPass đề xuất",
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
                mockupActivities.length,
                (index) => Padding(
                  padding:
                      EdgeInsets.only(left: getProportionateScreenWidth(20)),
                  child: RecommendationCard(
                    activity: mockupActivities[index],
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return ActivityDetail(activity: mockupActivities[index],);
                        }),
                      );
                    },
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
