import 'package:flutter/material.dart';

class Pass {
  final String name, image;
  final double overallRating, price, originalPrice;
  final PassChildrenPrice childrenPrice;
  final List<List<String>> destinationList;

  int get discountedPercentage {
    return ((originalPrice - price) / originalPrice * 100).floor();
  }

  Pass(
      {@required this.overallRating,
      @required this.name,
      @required this.image,
      @required this.price,
      @required this.originalPrice,
      @required this.destinationList,
      this.childrenPrice});
}

List<Pass> mockupPasses = [
  Pass(
    name: "Đi hết Hồ Chí Minh",
    image: "assets/images/thao_cam_vien.jpg",
    overallRating: 4.7,
    price: 250000,
    originalPrice: 460000,
    destinationList: [
      ["a"],
      ["b"],
      ["c", "d"], //List<String>
      ["e", "f", "g"]
    ],
  ),
  Pass(
    name: "Thổ địa Sài Gòn",
    image: "assets/images/dinh_doc_lap.jpg",
    overallRating: 4.5,
    price: 250000,
    originalPrice: 500000,
    childrenPrice: PassChildrenPrice(
      price: 125000,
      originalPrice: 300000,
    ),
    destinationList: [
      ["a"],
      ["b"],
      ["c", "d"],
      ["e", "f", "g"]
    ],
  ),
  Pass(
    name: "Thổ địa Sài Gòn",
    image: "assets/images/dia_dao_cu_chi.jpg",
    overallRating: 4.5,
    price: 250000,
    originalPrice: 372000,
    destinationList: [
      ["a"],
      ["b"],
      ["c", "d"],
      ["e", "f", "g"]
    ],
  ),
];

class PassChildrenPrice {
  final double price, originalPrice;

  PassChildrenPrice({
    @required this.price,
    @required this.originalPrice,
  });
}
