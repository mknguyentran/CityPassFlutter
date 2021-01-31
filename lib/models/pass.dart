import 'package:flutter/material.dart';

class Pass {
  final String name, image;
  final double overallRating;

  Pass({
    @required this.overallRating,
    @required this.name,
    @required this.image,
  });
}

List<Pass> mockupPasses = [
  Pass(
    name: "Đi hết Hồ Chí Minh",
    image: "assets/images/thao_cam_vien.jpg",
    overallRating: 4.7,
  ),
  Pass(
    name: "Thổ địa Sài Gòn",
    image: "assets/images/dinh_doc_lap.jpg",
    overallRating: 4.5,
  ),
  Pass(
    name: "Thổ địa Sài Gòn",
    image: "assets/images/dia_dao_cu_chi.jpg",
    overallRating: 4.5,
  ),
];
