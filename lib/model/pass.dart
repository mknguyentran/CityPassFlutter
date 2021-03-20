import 'package:city_pass/model/activity.dart';
import 'package:city_pass/model/city.dart';
import 'package:city_pass/models/ticketType.dart';
import 'package:flutter/material.dart';

class Pass {
  final String name, image;
  final City city;
  final double overallRating, price, originalPrice;
  final PassChildrenPrice childrenPrice;
  final List<IncludingDestination> includingDestination;
  final bool isGoodSeller, isBestSaving;

  int get discountedPercentage {
    return ((originalPrice - price) / originalPrice * 100).floor();
  }

  int get destinationAmount {
    int result = 0;
    for (var destinationCollection in includingDestination) {
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
    @required this.includingDestination,
    @required this.city,
    this.childrenPrice,
    this.isBestSaving = false,
    this.isGoodSeller = false,
  });
}

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
    } else {
      return optional;
    }
  }

  static const int allIncluded = 1;
  static const int optional = 2;

  IncludingDestination(this.destinationList, this.includingQuota)
      : assert(includingQuota <= destinationList.length),
        assert(includingQuota > 0);
}
