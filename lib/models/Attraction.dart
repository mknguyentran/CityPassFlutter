import 'package:flutter/material.dart';

class Attraction {
  final String name, image, briefDescription;

  Attraction({
    @required this.briefDescription,
    @required this.name,
    @required this.image,
  });
}

List<Attraction> travelSpots = [
  Attraction(
    name: "Thảo Cầm Viên",
    image: "assets/images/thao_cam_vien.jpg",
    briefDescription: "Tìm hiểu hơn 1000 cá thể động, thực vật khác nhau",
  ),
  Attraction(
    name: "Dinh Độc Lập",
    image: "assets/images/dinh_doc_lap.jpg",
    briefDescription: "Biểu tượng chiến thắng và hòa bình của thành phố",
  ),
  Attraction(
    name: "Địa đạo Củ Chi",
    image: "assets/images/dia_dao_cu_chi.jpg",
    briefDescription: "Tham quan hệ thống đường hầm dài đến 220km",
  ),
];
