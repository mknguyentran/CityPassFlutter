import 'package:flutter/material.dart';

class Activity {
  final String name, image, briefDescription;

  Activity({
    @required this.briefDescription,
    @required this.name,
    @required this.image,
  });
}

List<Activity> mockupActivities = [
  Activity(
    name: "Thảo Cầm Viên",
    image: "assets/images/thao_cam_vien.jpg",
    briefDescription: "Tìm hiểu hơn 1000 cá thể động, thực vật khác nhau",
  ),
  Activity(
    name: "Tham quan trọn gói Bà Nà Hills Đà Nẵng",
    image: "assets/images/banahill.jpg",
    briefDescription: "Thưởng thức cảnh sắc thuyệt vời cùng gần 100 trò chơi thú vị",
  ),
  Activity(
    name: "Dinh Độc Lập",
    image: "assets/images/dinh_doc_lap.jpg",
    briefDescription: "Biểu tượng chiến thắng và hòa bình của thành phố",
  ),
  Activity(
    name: "Địa đạo Củ Chi",
    image: "assets/images/dia_dao_cu_chi.jpg",
    briefDescription: "Tham quan hệ thống đường hầm dài đến 220km",
  ),
];
