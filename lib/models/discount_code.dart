import 'package:flutter/material.dart';

abstract class DiscountCode {
  final String name, codeName;
  final DateTime expiredAt;

  DiscountCode(this.codeName, this.name, this.expiredAt);
}

class PercentageDiscountCode extends DiscountCode {
  final int discountPercentage;
  PercentageDiscountCode(
    String codeName,
    String name,
    DateTime expiredAt, {
    @required this.discountPercentage,
  }) : super(codeName, name, expiredAt);
}

class AmountDiscountCode extends DiscountCode {
  final double discountAmount;
  AmountDiscountCode(
    String codeName,
    String name,
    DateTime expiredAt, {
    @required this.discountAmount,
  }) : super(codeName, name, expiredAt);
}

extension DiscountedPrice on double {
  withDiscountCode(DiscountCode discountCode) {
    if (discountCode is PercentageDiscountCode) {
      return this / 100 * (100 - discountCode.discountPercentage);
    } else if (discountCode is AmountDiscountCode) {
      return this - discountCode.discountAmount;
    }
  }

  discountedAmount(DiscountCode discountCode) {
    if (discountCode is PercentageDiscountCode) {
      return this / 100 * discountCode.discountPercentage;
    } else if (discountCode is AmountDiscountCode) {
      return discountCode.discountAmount;
    }
  }
}
