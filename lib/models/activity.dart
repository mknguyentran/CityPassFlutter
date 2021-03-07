import 'package:flutter/material.dart';

class Activity {
  final String name, image, address, briefDescription, detailedDescription;
  final List<ActivityTimetable> activityTimetable;
  final List<String> moreImages;

  Activity({
    @required this.briefDescription,
    @required this.detailedDescription,
    @required this.name,
    @required this.image,
    @required this.address,
    @required this.activityTimetable,
    @required this.moreImages,
  });
}

class ActivityTimetable {
  final String dayOfWeek, openTime;

  ActivityTimetable({
    @required this.dayOfWeek,
    @required this.openTime,
  });
}

List<Activity> mockupActivities = [
  Activity(
    name: "Tham quan Thảo Cầm Viên",
    image: "assets/images/thao_cam_vien.jpg",
    address: "2 Nguyễn Bỉnh Khiêm, Bến Nghé, Quận 1, Thành phố Hồ Chí Minh",
    briefDescription: "Tìm hiểu hơn 1000 cá thể động, thực vật khác nhau",
    detailedDescription: "Không chỉ là một công viên giải trí lành mạnh với không khí trong lành và hệ động thực vật phong phú, "
      + "Thảo Cầm Viên Sài Gòn còn giữ vai trò quan trọng trong việc giáo dục, bảo tồn và nghiên cứu về tự nhiên",
    activityTimetable: [
      ActivityTimetable(dayOfWeek: "Thứ hai", openTime: "07:30 - 17:30"),
      ActivityTimetable(dayOfWeek: "Thứ ba", openTime: "07:30 - 17:30"),
      ActivityTimetable(dayOfWeek: "Thứ tư", openTime: "07:30 - 17:30"),
      ActivityTimetable(dayOfWeek: "Thứ năm", openTime: "07:30 - 17:30"),
      ActivityTimetable(dayOfWeek: "Thứ sáu", openTime: "07:30 - 17:30"),
      ActivityTimetable(dayOfWeek: "Thứ bảy", openTime: "07:30 - 17:30"),
      ActivityTimetable(dayOfWeek: "Chủ nhật", openTime: "07:30 - 17:30"),
    ],
    moreImages: [
      "assets/images/thao_cam_vien_1.jpg",
      "assets/images/thao_cam_vien_2.jpg",
      "assets/images/thao_cam_vien_3.jpg",
    ],
  ),
  Activity(
    name: "Tham quan trọn gói Bà Nà Hills Đà Nẵng",
    image: "assets/images/banahill.jpg",
    address: "Thôn An Sơn, xã Hòa Ninh, huyện Hòa Vang, TP Đà Nẵng",
    briefDescription: "Thưởng thức cảnh sắc thuyệt vời cùng gần 100 trò chơi thú vị",
    detailedDescription: "Nằm ở độ cao 1.487m so với mực nước biển, Sun World Ba Na Hills được mênh danh là “chốn bồng lai tiên cảnh”, "
      + "sở hữu khí hậu tuyệt vời cùng cảnh quan thiên nhiên kỳ thú",
    activityTimetable: [
      ActivityTimetable(dayOfWeek: "Thứ hai", openTime: "08:00 - 17:00"),
      ActivityTimetable(dayOfWeek: "Thứ ba", openTime: "08:00 - 17:00"),
      ActivityTimetable(dayOfWeek: "Thứ tư", openTime: "08:00 - 17:00"),
      ActivityTimetable(dayOfWeek: "Thứ năm", openTime: "08:00 - 17:00"),
      ActivityTimetable(dayOfWeek: "Thứ sáu", openTime: "08:00 - 17:00"),
      ActivityTimetable(dayOfWeek: "Thứ bảy", openTime: "08:00 - 17:00"),
      ActivityTimetable(dayOfWeek: "Chủ nhật", openTime: "08:00 - 17:00"),
    ],
    moreImages: [
      "assets/images/banahill_1.jpg",
      "assets/images/banahill_2.jpg",
      "assets/images/banahill_3.jpg",
    ],
  ),
  Activity(
    name: "Dinh Độc Lập",
    image: "assets/images/dinh_doc_lap.jpg",
    address: "135 Nam Kỳ Khởi Nghĩa, Phường Bến Thành, Quận 1, Thành phố Hồ Chí Minh",
    briefDescription: "Biểu tượng chiến thắng và hòa bình của thành phố",
    detailedDescription: "Đây từng là nơi ở và làm việc của Tổng thống Việt Nam Cộng hòa. "
      + " Hiện nay, dinh đã được Chính phủ Việt Nam xếp hạng là di tích quốc gia đặc biệt.",
    activityTimetable: [
      ActivityTimetable(dayOfWeek: "Thứ hai", openTime: "08:00 - 13:00"),
      ActivityTimetable(dayOfWeek: "Thứ ba", openTime: "08:00 - 13:00"),
      ActivityTimetable(dayOfWeek: "Thứ tư", openTime: "08:00 - 13:00"),
      ActivityTimetable(dayOfWeek: "Thứ năm", openTime: "08:00 - 13:00"),
      ActivityTimetable(dayOfWeek: "Thứ sáu", openTime: "08:00 - 13:00"),
      ActivityTimetable(dayOfWeek: "Thứ bảy", openTime: "08:00 - 16:00"),
      ActivityTimetable(dayOfWeek: "Chủ nhật", openTime: "08:00 - 16:00"),
    ],
    moreImages: [
      "assets/images/dinh_doc_lap_1.jpg",
      "assets/images/dinh_doc_lap_2.jpg",
      "assets/images/dinh_doc_lap_3.jpg",
    ],
  ),
  Activity(
    name: "Tham quan Địa đạo Củ Chi",
    image: "assets/images/dia_dao_cu_chi.jpg",
    address: "Đường Tỉnh Lộ 15, Phú Hiệp, Củ Chi, Thành phố Hồ Chí Minh",
    briefDescription: "Tham quan hệ thống đường hầm dài đến 220km",
    detailedDescription: "Địa đạo Củ Chi là một hệ thống phòng thủ trong lòng đất ở huyện Củ Chi. Hệ thống này được "
      + "quân kháng chiến Việt Minh và Mặt trận Dân tộc Giải phóng miền Nam Việt Nam "
      + "đào trong thời kỳ Chiến tranh Đông Dương và Chiến tranh Việt Nam.",
    activityTimetable: [
      ActivityTimetable(dayOfWeek: "Thứ hai", openTime: "07:00 - 17:00"),
      ActivityTimetable(dayOfWeek: "Thứ ba", openTime: "07:00 - 17:00"),
      ActivityTimetable(dayOfWeek: "Thứ tư", openTime: "07:00 - 17:00"),
      ActivityTimetable(dayOfWeek: "Thứ năm", openTime: "07:00 - 17:00"),
      ActivityTimetable(dayOfWeek: "Thứ sáu", openTime: "07:00 - 17:00"),
      ActivityTimetable(dayOfWeek: "Thứ bảy", openTime: "07:00 - 17:00"),
      ActivityTimetable(dayOfWeek: "Chủ nhật", openTime: "07:00 - 17:00"),
    ],
    moreImages: [
      "assets/images/dia_dao_cu_chi_1.jpg",
      "assets/images/dia_dao_cu_chi_2.jpg",
      "assets/images/dia_dao_cu_chi_3.jpg",
    ]
  ),
];
