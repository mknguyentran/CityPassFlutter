import 'package:city_pass/model/activity.dart';
import 'package:flutter/material.dart';

class ActivityCategory {
  final String name, description, imagePath;
  final IconData icon;
  final Color themeColor;
  final List<Activity> activityList;

  ActivityCategory(
      this.name, this.description, this.imagePath, this.icon, this.themeColor,this.activityList);
}
