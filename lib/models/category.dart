import 'package:city_pass/model/activity.dart';
import 'package:flutter/material.dart';

class ActivityCategory {
  String name;
  int id;
  String description, imagePath;
 
  

  ActivityCategory.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.name = json['name'];
    this.description = json['description'];
    this.imagePath = json['urlImage'];
    
  }
}
