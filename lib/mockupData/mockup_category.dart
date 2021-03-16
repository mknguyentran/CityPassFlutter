import 'package:city_pass/models/category.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

ActivityCategory historicalHeritage = ActivityCategory(
  "Di tích lịch sử",
  "description",
  "assets/images/activity_category/historical_heritage.jpg",
  Icons.history_edu_rounded,
  Colors.orange,
);
ActivityCategory forKids = ActivityCategory(
  "Hoạt động thiếu nhi",
  "description",
  "assets/images/activity_category/for_kids.jpg",
  FontAwesomeIcons.running,
  Colors.yellow[700],
);
ActivityCategory leisureTravel = ActivityCategory(
  "Nghỉ dưỡng",
  "description",
  "assets/images/activity_category/leisure_travel.jpg",
  Icons.beach_access,
  Colors.teal[400],
);
ActivityCategory museum = ActivityCategory(
  "Bảo tàng",
  "description",
  "assets/images/activity_category/museum.jpg",
  Icons.museum,
  Colors.redAccent,
);
ActivityCategory sightseeing = ActivityCategory(
  "Ngắm cảnh",
  "description",
  "assets/images/activity_category/sightseeing.jpg",
  Icons.park,
  Colors.lightGreen,
);
ActivityCategory themePark = ActivityCategory(
  "Công viên giải trí",
  "description",
  "assets/images/activity_category/theme_park.jpg",
  FontAwesomeIcons.swimmingPool,
  Colors.cyan[300],
);

List<ActivityCategory> categoryList = [
  historicalHeritage,
  forKids,
  leisureTravel,
  museum,
  sightseeing,
  themePark,
];
