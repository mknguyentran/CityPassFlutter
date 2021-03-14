import 'package:city_pass/mockupData/mockup_activity.dart';
import 'package:city_pass/models/pass.dart';
import 'package:city_pass/models/user_pass.dart';

UserPass userPass1 = UserPass(
  expiredAt: new DateTime(2021, 2, 14),
  name: "Đi hết Hồ Chí Minh",
  image: "assets/images/thao_cam_vien.jpg",
  usedDestinationList: [
    UserPassHistoryEntry("Thảo Cầm Viên", new DateTime(2021, 1, 10)),
    UserPassHistoryEntry("Thảo Cầm Viên", new DateTime(2021, 1, 10)),
  ],
  availableDestinationList: [
    IncludingDestination([dinhDocLap, thaoCamVien], 2),
    IncludingDestination([thaoCamVien, baoTangMyThuat], 1),
  ],
);

List<UserPass> mockupUserPasses = [
  userPass1,
];
