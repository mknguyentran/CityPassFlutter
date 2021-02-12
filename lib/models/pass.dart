import 'package:flutter/material.dart';

class Pass {
  final String name, image;
  final double overallRating, price, childrenPrice;

  Pass( {
    @required this.overallRating,
    @required this.name,
    @required this.image,
    @required this.price,
    this.childrenPrice
  });
}

List<Pass> mockupPasses = [
  Pass(
    name: "Đi hết Hồ Chí Minh",
    image: "assets/images/thao_cam_vien.jpg",
    overallRating: 4.7,
    price: 250000,
  ),
  Pass(
    name: "Thổ địa Sài Gòn",
    image: "assets/images/dinh_doc_lap.jpg",
    overallRating: 4.5,
    price: 250000,
    childrenPrice: 100000
  ),
  Pass(
    name: "Thổ địa Sài Gòn",
    image: "assets/images/dia_dao_cu_chi.jpg",
    overallRating: 4.5,
    price: 250000,
  ),
];
