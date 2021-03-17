import 'package:city_pass/model/city.dart';
import 'package:flutter/material.dart';

class Activity {
  final String name,
      shortName,
      image,
      address,
      briefDescription,
      detailedDescription;
  final List<ActivityTimetable> activityTimetable;
  final List<String> moreImages;
  final City city;
  final int travelTime, visitedCounter;
  final double overallRating, travelDistance;
  final bool isNew, isPopular;

  Activity(
      {@required this.briefDescription,
      @required this.detailedDescription,
      @required this.name,
      @required this.image,
      @required this.address,
      @required this.activityTimetable,
      @required this.moreImages,
      @required this.city,
      this.travelTime,
      this.travelDistance,
      @required this.visitedCounter,
      @required this.overallRating,
      this.isNew = false,
      this.isPopular = false,
      this.shortName});

  String get getShortName {
    return shortName != null ? shortName : name;
  }
}

class ActivityTimetable {
  final String dayOfWeek, openTime;

  ActivityTimetable({
    @required this.dayOfWeek,
    @required this.openTime,
  });
}
