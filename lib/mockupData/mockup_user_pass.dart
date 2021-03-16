import 'package:city_pass/mockupData/mockup_activity.dart';
import 'package:city_pass/mockupData/mockup_pass.dart';
import 'package:city_pass/models/user_pass.dart';

UserPass userPass1 = UserPass(
  expiredAt: new DateTime(2021, 3, 31),
  name: "Đi hết Hồ Chí Minh",
  image: "assets/images/thao_cam_vien.jpg",
  usedDestinationList: [
    UserPassHistoryEntry("Thảo Cầm Viên", new DateTime(2021, 1, 10, 7, 17)),
    UserPassHistoryEntry(
        "Bảo tàng Y học Cổ truyền Việt Nam", new DateTime(2021, 1, 10, 15, 22)),
  ],
  availableDestinationList: [
    dinhDocLap,
    thaoCamVien,
    baoTangMyThuat,
  ],
  originalPass: hcmPass_1,
);

List<UserPass> mockupUserPasses = [
  userPass1,
];
