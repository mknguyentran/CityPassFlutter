import 'package:flutter/material.dart';

class City {
  final String name;

  City(this.name);
}

List<List<City>> mockupCities = [
  [
    City("Hà Nội"),
    City("Bắc Ninh"),
    City("Lào Cai"),
    City("Hải Phòng"),
    City("Hà Giang"),
    City("Hải Dương"),
    City("Thái Bình"),
  ],
  [
    City("Đà Nẵng"),
    City("Hà Tĩnh"),
    City("Thừa Thiên Huế"),
    City("Ninh Thuận"),
    City("Nha Trang"),
    City("Phú Yên"),
    City("Quảng Ngãi"),
    City("Phan Thiết"),
  ],
  [
    City("TP. Hồ Chí Minh"),
    City("Vũng Tàu"),
    City("Đồng Tháp"),
    City("Bến Tre"),
    City("Vĩnh Long"),
    City("Sóc Trăng"),
    City("Bình Dương"),
  ],
];
