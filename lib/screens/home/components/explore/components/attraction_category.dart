import 'package:city_pass/constants.dart';
import 'package:city_pass/mockupData/mockup_category.dart';
import 'package:city_pass/models/category.dart';
import 'package:city_pass/screens/activity_category/activity_category.dart';
import 'package:city_pass/shared/section_title.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AttractionCategory extends StatelessWidget {
  const AttractionCategory({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [kDefaultShadow],
        ),
        child: Column(
          children: [
            SectionTitle(
                title: "Bạn muốn đi đâu?", titleColor: primaryLightColor),
            VerticalSpacing(
              of: 30,
            ),
            Wrap(
              alignment: WrapAlignment.start,
              spacing: getProportionateScreenWidth(30),
              runSpacing: getProportionateScreenWidth(15),
              children: [
                ...List.generate(
                  categoryList.length,
                  (index) => ActivityCategoryButton(
                    category: categoryList[index],
                    tapCallback: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) {
                            return ActivityCategoryScreen(
                              category: categoryList[index],
                              
                            );
                          },
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ActivityCategoryButton extends StatelessWidget {
  const ActivityCategoryButton({
    Key key,
    this.tapCallback,
    @required this.category,
  }) : super(key: key);

  final GestureTapCallback tapCallback;
  final ActivityCategory category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapCallback,
      child: Container(
        width: 55,
        height: 70,
        child: Column(
          children: [
            FaIcon(
              category.icon,
              size: 30,
              color: category.themeColor,
            ),
            VerticalSpacing(
              of: 10,
            ),
            Expanded(
              child: Text(
                category.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: kTextColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
