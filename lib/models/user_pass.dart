import 'package:flutter/material.dart';

class UserPass {
  final String name, image;
  final int totalDestination, usedDestination;
  final DateTime expiredAt;

  UserPass({
    @required this.totalDestination,
    @required this.usedDestination,
    @required this.expiredAt,
    @required this.name,
    @required this.image,
  })  : assert(usedDestination >= 0 && totalDestination > 0),
        assert(usedDestination <= totalDestination);

  static List<UserPass> mockupUserPasses = [
    UserPass(
      totalDestination: 6,
      usedDestination: 2,
      expiredAt: new DateTime(2021, 2, 14),
      name: "Đi hết Hồ Chí Minh",
      image: "assets/images/thao_cam_vien.jpg",
    ),
    UserPass(
      totalDestination: 6,
      usedDestination: 2,
      expiredAt: new DateTime(2021, 2, 14),
      name: "Đi hết Hồ Chí Minh",
      image: "assets/images/thao_cam_vien.jpg",
    ),
    UserPass(
      totalDestination: 6,
      usedDestination: 2,
      expiredAt: new DateTime(2021, 2, 14),
      name: "Đi hết Hồ Chí Minh",
      image: "assets/images/thao_cam_vien.jpg",
    ),
    UserPass(
      totalDestination: 6,
      usedDestination: 2,
      expiredAt: new DateTime(2021, 2, 14),
      name: "Đi hết Hồ Chí Minh",
      image: "assets/images/thao_cam_vien.jpg",
    ),
  ];
}
