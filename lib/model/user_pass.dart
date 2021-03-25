import 'package:city_pass/model/activity.dart';

import 'package:city_pass/models/pass.dart';
import 'package:flutter/material.dart';

class UserPass {
  final String name, image;
  final DateTime expiredAt;
  final List<Activity> availableDestinationList;
  final List<UserPassHistoryEntry> usedDestinationList;
  final Pass originalPass;

  UserPass({
    @required this.expiredAt,
    @required this.name,
    @required this.image,
    @required this.availableDestinationList,
    @required this.usedDestinationList,
    @required this.originalPass
  });

  int get totalDestination {
    return availableDestinationList.length + usedDestinationList.length;
  }

  int get usedDestination {
    return usedDestinationList.length;
  }
}

class UserPassHistoryEntry {
  final String destination;
  final DateTime usedAt;

  UserPassHistoryEntry(this.destination, this.usedAt);
}
