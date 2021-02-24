import 'package:city_pass/models/pass.dart';
import 'package:flutter/material.dart';

class OrderDetail {
  final Pass pass;
  final int amount, childrenAmount;

  OrderDetail(
    @required this.pass,
    @required this.amount,
    this.childrenAmount,
  );

  double get total {
    if (pass.childrenPrice != null) {
      return (pass.price * amount) +
          (pass.childrenPrice.price * childrenAmount);
    } else {
      return (pass.price * amount);
    }
  }
}
