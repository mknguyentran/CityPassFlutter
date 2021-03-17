import 'package:animations/animations.dart';
import 'package:city_pass/constants.dart';
import 'package:city_pass/model/pass.dart';
import 'package:city_pass/screens/home/components/featured/components/pass_recommendation_card.dart';
import 'package:city_pass/screens/pass_detail/pass_detail.dart';
import 'package:city_pass/shared/section_title.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PassRecommendation extends StatelessWidget {
  const PassRecommendation({
    Key key,
    @required this.title,
    @required this.children,
    this.subtitle,
  }) : super(key: key);

  final String title, subtitle;
  final List<Pass> children;

  @override
  Widget build(BuildContext context) {
    List<Pass> _passList = new List.from(children);
    _passList.shuffle();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(
          title: title,
          hasPadding: true,
          showAllCallback: () {},
        ),
        if (subtitle != null)
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 5, horizontal: kDefaultPadding),
            child: Text(
              subtitle,
            ),
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
                _passList.length,
                (index) => Padding(
                  padding:
                      EdgeInsets.only(left: getProportionateScreenWidth(20)),
                  child: OpenContainer(
                    closedElevation: 1,
                    closedShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    closedBuilder: (context, action) => PassRecommendationCard(
                      pass: _passList[index],
                    ),
                    openBuilder: (context, action) => PassDetail(
                      pass: _passList[index],
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
