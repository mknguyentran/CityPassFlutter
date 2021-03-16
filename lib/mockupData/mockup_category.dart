import 'package:city_pass/mockupData/mockup_activity.dart';
import 'package:city_pass/models/category.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

ActivityCategory historicalHeritage = ActivityCategory(
  "Di tích lịch sử",
  "Trở về quá khứ với những di tích mang giá trị lịch sử và văn hoá độc đáo. ",
  "assets/images/activity_category/historical_heritage.jpg",
  Icons.history_edu_rounded,
  Colors.brown,
  historicalHeritageList,
);
ActivityCategory forKids = ActivityCategory(
    "Hoạt động thiếu nhi",
    "Cho trẻ được khám phá những địa điểm trong mơ và những trò chơi đặc sắc nhất. ",
    "assets/images/activity_category/for_kids.jpg",
    FontAwesomeIcons.running,
    Colors.orange,
    forKidsList);
ActivityCategory leisureTravel = ActivityCategory(
    "Nghỉ dưỡng",
    "Rũ bỏ cuộc sống hối hả hằng ngày và chìm vào những không gian thư thái, yên bình. ",
    "assets/images/activity_category/leisure_travel.jpg",
    Icons.beach_access,
    Colors.teal[400],
    leisureTravelList);
ActivityCategory museum = ActivityCategory(
  "Bảo tàng",
  "Mở mang kiến thức với những hiện vật và đồ vật được tái hiện sinh động. ",
  "assets/images/activity_category/museum.jpg",
  Icons.museum,
  Colors.redAccent,
  museumList,
);
ActivityCategory sightseeing = ActivityCategory(
  "Ngắm cảnh",
  "Phóng xa tầm mắt và bắt lấy những tấm ảnh để đời. ",
  "assets/images/activity_category/sightseeing.jpg",
  Icons.park,
  Colors.lightGreen,
  sightseeingList,
);
ActivityCategory themePark = ActivityCategory(
  "Công viên giải trí",
  "Trở thành thiếu nhi trong 1 ngày. ",
  "assets/images/activity_category/theme_park.jpg",
  FontAwesomeIcons.swimmingPool,
  Colors.amber,
  themeParkList,
);

List<ActivityCategory> categoryList = [
  historicalHeritage,
  forKids,
  leisureTravel,
  museum,
  sightseeing,
  themePark,
];
