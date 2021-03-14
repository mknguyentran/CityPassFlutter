import 'package:city_pass/models/pass.dart';
import 'package:flutter/material.dart';

class UserPass {
  final String name, image;
  final DateTime expiredAt;
  final List<IncludingDestination> availableDestinationList;
  final List<UserPassHistoryEntry> usedDestinationList;

  UserPass({
    @required this.expiredAt,
    @required this.name,
    @required this.image,
    @required this.availableDestinationList,
    @required this.usedDestinationList,
  });

  int get totalDestination {
    int result = 0;
    for (var destinationCollection in availableDestinationList) {
      result += destinationCollection.includingQuota;
    }
    return result;
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
