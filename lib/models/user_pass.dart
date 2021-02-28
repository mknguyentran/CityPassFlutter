import 'package:city_pass/models/pass.dart';
import 'package:flutter/material.dart';

class UserPass {
  final String name, image;
  final int totalDestination, usedDestination;
  final DateTime expiredAt;
  final List<IncludingDestination> availableDestinationList;
  final List<UserPassHistoryEntry> usedDestinationList;

  UserPass({
    @required this.totalDestination,
    @required this.usedDestination,
    @required this.expiredAt,
    @required this.name,
    @required this.image,
    @required this.availableDestinationList,
    @required this.usedDestinationList,
  })  : assert(usedDestination >= 0 && totalDestination > 0),
        assert(usedDestination <= totalDestination);

  static List<UserPass> mockupUserPasses = [
    UserPass(
      totalDestination: 6,
      usedDestination: 2,
      expiredAt: new DateTime(2021, 2, 14),
      name: "Đi hết Hồ Chí Minh",
      image: "assets/images/thao_cam_vien.jpg",
      usedDestinationList: [
        UserPassHistoryEntry("Thảo Cầm Viên", new DateTime(2021, 1, 10)),
        UserPassHistoryEntry("Thảo Cầm Viên", new DateTime(2021, 1, 10)),
      ],
      availableDestinationList: [
        IncludingDestination(["a","b"], 2),
        IncludingDestination(["c","d"], 1),
        IncludingDestination(["e","f","g"], 2),
      ]
    ),
    UserPass(
      totalDestination: 6,
      usedDestination: 2,
      expiredAt: new DateTime(2021, 2, 14),
      name: "Đi hết Hồ Chí Minh",
      image: "assets/images/thao_cam_vien.jpg",
      usedDestinationList: [
        UserPassHistoryEntry("Thảo Cầm Viên", new DateTime(2021, 1, 10)),
        UserPassHistoryEntry("Thảo Cầm Viên", new DateTime(2021, 1, 10)),
      ],
      availableDestinationList: [
        IncludingDestination(["a","b"], 2),
        IncludingDestination(["c","d"], 1),
        IncludingDestination(["e","f","g"], 2),
      ]
    ),
    UserPass(
      totalDestination: 6,
      usedDestination: 2,
      expiredAt: new DateTime(2021, 2, 14),
      name: "Đi hết Hồ Chí Minh",
      image: "assets/images/thao_cam_vien.jpg",
      usedDestinationList: [
        UserPassHistoryEntry("Thảo Cầm Viên", new DateTime(2021, 1, 10)),
        UserPassHistoryEntry("Thảo Cầm Viên", new DateTime(2021, 1, 10)),
      ],
      availableDestinationList: [
        IncludingDestination(["a","b"], 2),
        IncludingDestination(["c","d"], 1),
        IncludingDestination(["e","f","g"], 2),
      ]
    ),
    UserPass(
      totalDestination: 6,
      usedDestination: 2,
      expiredAt: new DateTime(2021, 2, 14),
      name: "Đi hết Hồ Chí Minh",
      image: "assets/images/thao_cam_vien.jpg",
      usedDestinationList: [
        UserPassHistoryEntry("Thảo Cầm Viên", new DateTime(2021, 1, 10)),
        UserPassHistoryEntry("Thảo Cầm Viên", new DateTime(2021, 1, 10)),
      ],
      availableDestinationList: [
        IncludingDestination(["a","b"], 2),
        IncludingDestination(["c","d"], 1),
        IncludingDestination(["e","f","g"], 2),
      ]
    ),
  ];
}

class UserPassHistoryEntry {
  final String destination;
  final DateTime usedAt;

  UserPassHistoryEntry(this.destination, this.usedAt);
}
