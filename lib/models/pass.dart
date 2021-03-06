import 'package:city_pass/models/city.dart';
import 'package:flutter/material.dart';

class Pass {
  final String name, image;
  final City city;
  final double overallRating, price, originalPrice;
  final PassChildrenPrice childrenPrice;
  final List<IncludingDestination> destinationList;
  final bool isGoodSeller, isBestSaving;

  int get discountedPercentage {
    return ((originalPrice - price) / originalPrice * 100).floor();
  }

  int get destinationAmount {
    int result = 0;
    for (var destinationCollection in destinationList) {
      result += destinationCollection.includingQuota;
    }
    return result;
  }

  Pass({
    @required this.overallRating,
    @required this.name,
    @required this.image,
    @required this.price,
    @required this.originalPrice,
    @required this.destinationList,
    @required this.city,
    this.childrenPrice,
    this.isBestSaving = false,
    this.isGoodSeller = false,
  });
}

List<Pass> mockupPasses = [
  Pass(
    name: "Kì nghỉ ở Đà Nẵng",
    image: "assets/images/banahill.jpg",
    overallRating: 4.9,
    price: 780000,
    originalPrice: 1200000,
    destinationList: [
      IncludingDestination(["a", "b"], 2),
      IncludingDestination(["c", "d"], 1),
      IncludingDestination(["e", "f", "g"], 2),
    ],
    city: City("Đà Nẵng"),
    isGoodSeller: true,
  ),
  Pass(
    name: "Đi hết Hồ Chí Minh",
    image: "assets/images/thao_cam_vien.jpg",
    overallRating: 4.7,
    price: 250000,
    originalPrice: 460000,
    destinationList: [
      IncludingDestination(["a", "b"], 2),
      IncludingDestination(["c", "d"], 1),
      IncludingDestination(["e", "f", "g"], 2),
    ],
    city: City("TP. Hồ Chí Minh"),
    isGoodSeller: true,
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
      IncludingDestination(["a", "b"], 2),
      IncludingDestination(["c", "d"], 1),
      IncludingDestination(["e", "f", "g", "h"], 2),
    ],
    city: City("TP. Hồ Chí Minh"),
    isBestSaving: true,
    isGoodSeller: true,
  ),
  Pass(
    name: "Thổ địa Sài Gòn",
    image: "assets/images/dia_dao_cu_chi.jpg",
    overallRating: 4.5,
    price: 250000,
    originalPrice: 372000,
    destinationList: [
      IncludingDestination(["a", "b"], 2),
      IncludingDestination(["c", "d"], 1),
      IncludingDestination(["e", "f", "g"], 2),
    ],
    city: City("TP. Hồ Chí Minh"),
  ),
];

class PassChildrenPrice {
  final double price, originalPrice;

  PassChildrenPrice({
    @required this.price,
    @required this.originalPrice,
  });
}

class IncludingDestination {
  final List<String> destinationList;
  final int includingQuota;

  bool get isAllIncluded {
    return includingQuota == destinationList.length;
  }

  bool get isBinaryOptional {
    return destinationList.length == 2 && includingQuota == 1;
  }

  int get type {
    if (isAllIncluded) {
      return allIncluded;
    } else if (isBinaryOptional) {
      return binaryOptional;
    } else {
      return optional;
    }
  }

  static const int allIncluded = 1;
  static const int binaryOptional = 2;
  static const int optional = 3;

  IncludingDestination(this.destinationList, this.includingQuota)
      : assert(includingQuota <= destinationList.length),
        assert(includingQuota > 0);
}
