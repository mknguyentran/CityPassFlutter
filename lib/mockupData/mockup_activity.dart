import 'package:city_pass/mockupData/mockup_city.dart';
import 'package:city_pass/models/activity.dart';
import 'package:city_pass/models/city.dart';

Activity thaoCamVien = Activity(
  name: "Tham quan Thảo Cầm Viên",
  image: "assets/images/thao_cam_vien.jpg",
  address: "2 Nguyễn Bỉnh Khiêm, Bến Nghé, Quận 1, Thành phố Hồ Chí Minh",
  briefDescription: "Tìm hiểu hơn 1000 cá thể động, thực vật khác nhau",
  detailedDescription:
      "Không chỉ là một công viên giải trí lành mạnh với không khí trong lành và hệ động thực vật phong phú, " +
          "Thảo Cầm Viên Sài Gòn còn giữ vai trò quan trọng trong việc giáo dục, bảo tồn và nghiên cứu về tự nhiên",
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
  city: City("TP. Hồ Chí Minh"),
  travelTime: 26,
  travelDistance: 4.2,
  overallRating: 4.8,
  visitedCounter: 167,
  isPopular: true,
);

Activity baNaHills = Activity(
  name: "Tham quan trọn gói Bà Nà Hills Đà Nẵng",
  image: "assets/images/banahill.jpg",
  address: "Thôn An Sơn, xã Hòa Ninh, huyện Hòa Vang, TP Đà Nẵng",
  briefDescription:
      "Thưởng thức cảnh sắc thuyệt vời cùng gần 100 trò chơi thú vị",
  detailedDescription:
      "Nằm ở độ cao 1.487m so với mực nước biển, Sun World Ba Na Hills được mênh danh là “chốn bồng lai tiên cảnh”, " +
          "sở hữu khí hậu tuyệt vời cùng cảnh quan thiên nhiên kỳ thú",
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
  city: City("Đà Nẵng"),
  overallRating: 4.6,
  visitedCounter: 237,
  isPopular: true,
);

Activity dinhDocLap = Activity(
  name: "Dinh Độc Lập",
  image: "assets/images/dinh_doc_lap.jpg",
  address:
      "135 Nam Kỳ Khởi Nghĩa, Phường Bến Thành, Quận 1, Thành phố Hồ Chí Minh",
  briefDescription: "Biểu tượng chiến thắng và hòa bình của thành phố",
  detailedDescription:
      "Đây từng là nơi ở và làm việc của Tổng thống Việt Nam Cộng hòa. " +
          " Hiện nay, dinh đã được Chính phủ Việt Nam xếp hạng là di tích quốc gia đặc biệt.",
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
  city: City("TP. Hồ Chí Minh"),
  travelTime: 29,
  travelDistance: 4.7,
  overallRating: 4.3,
  visitedCounter: 120,
);

Activity diadaoCuChi = Activity(
  name: "Tham quan Địa đạo Củ Chi",
  image: "assets/images/dia_dao_cu_chi.jpg",
  address: "Đường Tỉnh Lộ 15, Phú Hiệp, Củ Chi, Thành phố Hồ Chí Minh",
  briefDescription: "Tham quan hệ thống đường hầm dài đến 220km",
  detailedDescription:
      "Địa đạo Củ Chi là một hệ thống phòng thủ trong lòng đất ở huyện Củ Chi. Hệ thống này được " +
          "quân kháng chiến Việt Minh và Mặt trận Dân tộc Giải phóng miền Nam Việt Nam " +
          "đào trong thời kỳ Chiến tranh Đông Dương và Chiến tranh Việt Nam.",
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
  ],
  city: City("TP. Hồ Chí Minh"),
  travelTime: 33,
  travelDistance: 6.2,
  overallRating: 4.9,
  visitedCounter: 132,
  isNew: true,
);

Activity artInParadise = Activity(
  briefDescription:
      "Hóa thân thành những nhân vật cổ tích trong triển lãm tranh 3D",
  detailedDescription:
      "Không chỉ được chiêm ngưỡng các tác phẩm 3D, hoạt động thú vị và chủ yếu ở Art in Paradise chính là tạo dáng và chụp ảnh. Bạn có thể hóa thân thành những nhân vật cổ tích trong thế giới thần tiên, đặt chân vào khu rừng bí ẩn giữa những lăng mộ Ai Cập cổ đại hay hóa thân thành những chú chim đại bàng tung cánh…",
  name: "Lạc vào thế giới tranh 3D cùng Bảo tàng Art in Paradise",
  image: "assets/images/art_in_paradise.jpeg",
  address:
      "Lô C2-10 đường Trần Nhân Tông, phường Thọ Quang, quận Sơn Trà, thành phố Đà Nẵng",
  moreImages: [
    "assets/images/art_in_paradise1.jpeg",
    "assets/images/art_in_paradise2.jpeg",
    "assets/images/art_in_paradise3.jpeg",
    "assets/images/art_in_paradise4.jpeg"
  ],
  city: daNangCity,
  visitedCounter: 345,
  overallRating: 3.6,
  activityTimetable: [
    ActivityTimetable(dayOfWeek: "Thứ hai", openTime: "07:00 - 17:00"),
    ActivityTimetable(dayOfWeek: "Thứ ba", openTime: "07:00 - 17:00"),
    ActivityTimetable(dayOfWeek: "Thứ tư", openTime: "07:00 - 17:00"),
    ActivityTimetable(dayOfWeek: "Thứ năm", openTime: "07:00 - 17:00"),
    ActivityTimetable(dayOfWeek: "Thứ sáu", openTime: "07:00 - 17:00"),
    ActivityTimetable(dayOfWeek: "Thứ bảy", openTime: "07:00 - 17:00"),
    ActivityTimetable(dayOfWeek: "Chủ nhật", openTime: "07:00 - 17:00"),
  ],
);

Activity baoTangMyThuat = Activity(
  briefDescription:
      "Điểm dừng chân lý tưởng cho những tâm hồn yêu văn hóa và đam mê nghệ thuật",
  detailedDescription:
      "Nếu có ai là “người hâm mộ” của phong cách vintage, của những tấm ảnh phim thì nhất định phải một lần ghé thăm nơi đây. Ta có thể ví bảo tàng mỹ thuật Hồ Chí Minh như là một chiều không gian xưa cũ, nơi thời gian dừng trôi, lấy màu vàng làm tông màu chính. Từ cổng chính bước vào, bạn sẽ dễ dàng nhận thấy cả tòa nhà là một công trình kiến trúc đồ sộ màu vàng nằm giữa không gian xanh mát rộng lớn. \n\nKhi bước dọc theo những hành lang, màu vàng dần biến mất và thay vào đó là gam màu xám xịt của bức tường, của những song cửa sổ hai bên. Bạn sẽ phản bác rằng màu xám là một tông màu hiện đại cơ mà, nhưng không, trong không gian của bảo tàng, gam màu này như đánh mất sự máy móc lạnh lẽo vốn có của mình mà lại đượm sắc thái nhàn nhạt của quá khứ, về một thời đã qua.\n\n",
  name: "Tham quan Bảo tàng Mỹ thuật TP HCM",
  image: "assets/images/bao_tang_my_thuat/bao_tang_my_thuat.jpg",
  address: "address",
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
    "assets/images/bao_tang_my_thuat/bao-tang-my-thuat-1.jpg",
    "assets/images/bao_tang_my_thuat/bao-tang-my-thuat-2.jpg",
    "assets/images/bao_tang_my_thuat/bao-tang-my-thuat-3.jpg",
    "assets/images/bao_tang_my_thuat/bao-tang-my-thuat-4.jpg"
  ],
  city: hcmCity,
  visitedCounter: 254,
  overallRating: 3.5,
);
List<Activity> mockupActivities = [
  thaoCamVien,
  baNaHills,
  dinhDocLap,
  diadaoCuChi,
  artInParadise,
  baoTangMyThuat,
];

List<Activity> mockupNearYouActivities = [
  thaoCamVien,
  dinhDocLap,
  diadaoCuChi,
];
