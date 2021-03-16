import 'package:city_pass/constants.dart';
import 'package:city_pass/models/category.dart';
import 'package:city_pass/screens/activity_category/components/activity_category_header.dart';
import 'package:city_pass/screens/home/components/explore/components/activity_recommendation_vertical.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActivityCategoryScreen extends StatelessWidget {
  final ActivityCategory category;

  const ActivityCategoryScreen({
    Key key,
    @required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      backgroundColor: darkGrayBackground,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ActivityCategoryHeader(category: category),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 60),
              child: ActivityRecommendationVertical(children: category.activityList),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      brightness: Brightness.light,
      leading: IconButton(
        color: primaryDarkColor,
        icon: Icon(
          CupertinoIcons.chevron_left_circle_fill,
          size: 30,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
