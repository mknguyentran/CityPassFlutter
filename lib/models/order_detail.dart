import 'dart:collection';

import 'package:city_pass/models/pass.dart';
import 'package:flutter/material.dart';

abstract class Order extends HashMap<Pass, int> {
  factory Order() => HashMap.identity();
}
