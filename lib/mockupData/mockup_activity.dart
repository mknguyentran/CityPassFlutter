import 'package:city_pass/mockupData/mockup_city.dart';
import 'package:city_pass/models/activity.dart';

//1. Hà Nội
//+ Baara Land
Activity baaraLand = Activity(
  name: "Tham quan BaaraLand",
  shortName: "Bãi biển BaaraLand",
  image: "assets/images/baraland/baaraland.jpg",
  address: "Thôn Đa Phúc, Quốc Oai, Hà Nội",
  briefDescription: "Bãi biển nhân tạo lớn nhất Đông Nam Á",
  detailedDescription:
      "Được ví như là Tuần Châu giữa lòng Hà Nội, vì vậy khi đến đây bạn sẽ không khỏi bị choáng ngợp bởi không gian," +
          "cơ sở hạ tầng, trang thiết bị, trò chơi, màn biểu diễn, dịch vụ tầm cỡ quốc tế.",
  activityTimetable: [
    ActivityTimetable(
        dayOfWeek: "Thứ Hai", openTime: "07:30 - 11:30 và 13:00 - 19:00"),
    ActivityTimetable(
        dayOfWeek: "Thứ Ba", openTime: "07:30 - 11:30 và 13:00 - 19:00"),
    ActivityTimetable(
        dayOfWeek: "Thứ Tư", openTime: "07:30 - 11:30 và 13:00 - 19:00"),
    ActivityTimetable(
        dayOfWeek: "Thứ Năm", openTime: "07:30 - 11:30 và 13:00 - 19:00"),
    ActivityTimetable(
        dayOfWeek: "Thứ Sáu", openTime: "07:30 - 11:30 và 13:00 - 19:00"),
    ActivityTimetable(dayOfWeek: "Thứ Bảy", openTime: "07:30 - 17:30"),
    ActivityTimetable(dayOfWeek: "Chủ Nhật", openTime: "07:30 - 17:30"),
  ],
  moreImages: [
    "assets/images/baraland/baaraland.jpg",
    "assets/images/baraland/bara_2.jpg",
    "assets/images/baraland/bara_3.jpg",
  ],
  city: haNoiCity,
  travelTime: 26,
  travelDistance: 4.2,
  overallRating: 4.8,
  visitedCounter: 167,
  isPopular: true,
);

// 2. Quoc Tu Giam
Activity vanMieuQuocTuGiam = Activity(
  name: "Văn Miếu Quốc Tử Giám",
  shortName: "Văn Miếu Quốc Tử Giám",
  image: "assets/images/van_mieu_quoc_tu_giam/quoc_tu_giam_1.jpg",
  address: "58 Quốc Tử Giám, Văn Miếu, Đống Đa, Hà Nội ",
  briefDescription:
      "Văn Miếu – Quốc Tử Giám là quần thể di tích đa dạng và phong phú hàng đầu của thủ đô Hà Nội," +
          "nằm ở phía nam Kinh thành Thăng Long",
  detailedDescription:
      "Là quần thể di tích về trường đại học đầu tiên của nước ta, Văn Miếu không chỉ là di tích lịch sử văn hóa mà còn là nơi được rất nhiều sĩ tử, học trò tới đây để cầu may mắn trong thi cử, học hành",
  activityTimetable: [
    ActivityTimetable(
        dayOfWeek: "Thứ Hai", openTime: "07:30 - 11:30 và 13:00 - 19:00"),
    ActivityTimetable(
        dayOfWeek: "Thứ Ba", openTime: "07:30 - 11:30 và 13:00 - 19:00"),
    ActivityTimetable(
        dayOfWeek: "Thứ Tư", openTime: "07:30 - 11:30 và 13:00 - 19:00"),
    ActivityTimetable(
        dayOfWeek: "Thứ Năm", openTime: "07:30 - 11:30 và 13:00 - 19:00"),
    ActivityTimetable(
        dayOfWeek: "Thứ Sáu", openTime: "07:30 - 11:30 và 13:00 - 19:00"),
    ActivityTimetable(dayOfWeek: "Thứ Bảy", openTime: "07:30 - 17:30"),
    ActivityTimetable(dayOfWeek: "Chủ Nhật", openTime: "07:30 - 17:30"),
  ],
  moreImages: [
    "assets/images/van_mieu_quoc_tu_giam/quoc_tu_giam_1.jpg",
    "assets/images/van_mieu_quoc_tu_giam/quoc_tu_giam_2.jpg",
    "assets/images/van_mieu_quoc_tu_giam/van_mieu_quoc_tu_giam_3.jpg",
  ],
  city: haNoiCity,
  travelTime: 26,
  travelDistance: 4.2,
  overallRating: 4.8,
  visitedCounter: 167,
  isPopular: true,
);
//3. Bảo tàng Hà Nội

Activity baoTangHN = Activity(
  name: "Bảo Tàng Hà Nội",
  shortName: "Bảo Tàng Hà Nội",
  image: "assets/images/bao_tang_HN/bao_tang_HN_1.jpg",
  address: "Phạm Hùng, Mễ Trì, Nam Từ Liêm, Hà Nội",
  briefDescription:
      "Bảo tàng Hà Nội, trước đây nằm ở số 5B phố Hàm Long, quận Hoàn Kiếm, Hà Nội, là nơi trưng bày giới thiệu về thủ đô Hà Nội từ khi dựng nước đến nay",
  detailedDescription:
      "Thủ đô cũng có riêng cho mình một địa điểm để trưng bày những nét độc đáo trong nền văn hóa của mảnh đất hơn một ngàn năm tuổi",
  activityTimetable: [
    ActivityTimetable(
        dayOfWeek: "Thứ Hai", openTime: "07:30 - 11:30 và 13:00 - 19:00"),
    ActivityTimetable(
        dayOfWeek: "Thứ Ba", openTime: "07:30 - 11:30 và 13:00 - 19:00"),
    ActivityTimetable(
        dayOfWeek: "Thứ Tư", openTime: "07:30 - 11:30 và 13:00 - 19:00"),
    ActivityTimetable(
        dayOfWeek: "Thứ Năm", openTime: "07:30 - 11:30 và 13:00 - 19:00"),
    ActivityTimetable(
        dayOfWeek: "Thứ Sáu", openTime: "07:30 - 11:30 và 13:00 - 19:00"),
    ActivityTimetable(dayOfWeek: "Thứ Bảy", openTime: "07:30 - 17:30"),
    ActivityTimetable(dayOfWeek: "Chủ Nhật", openTime: "07:30 - 17:30"),
  ],
  moreImages: [
    "assets/images/bao_tang_HN/bao_tang_HN_2.jpg",
    "assets/images/bao_tang_HN/bao_tang_HN_2.jpg",
    "assets/images/bao_tang_HN/bao_tang_HN_4.jpg",
  ],
  city: haNoiCity,
  travelTime: 26,
  travelDistance: 4.2,
  overallRating: 4.8,
  visitedCounter: 167,
  isPopular: true,
);

//4. Bảo Tàng Lịch Sử Quốc Gia

Activity baotangLSQG = Activity(
  name: "Bảo tàng Lịch sử Quốc gia",
  shortName: "Bảo tàng Lịch sử Quốc gia",
  image: "assets/images/bao_tang_LSQG/bao_tang_LSQG_1.jpg",
  address: "216 Đường Trần Quang Khải, Tràng Tiền, Hoàn Kiếm, Hà Nội",
  briefDescription:
      "Bảo tàng Lịch sử Việt Nam, cùng với Bảo tàng Cách mạng Việt Nam là hai bảo tàng đã được sáp nhập thành Bảo tàng Lịch sử quốc gia, tọa lạc ở thành phố Hà Nội.",
  detailedDescription:
      "Tọa lạc ở quận Hoàn Kiếm đã từ lâu đời, bảo tàng lịch sử quốc gia là nơi trưng bày, lưu giữ và bảo quản khoảng 200.000 hiện vật, tư liệu lịch sử văn hóa Việt Nam. Nơi đây còn trưng bày hiện vật thuộc các nền văn hóa khảo cổ từ sơ kỳ thời đại đồ đá cũ, những kiệt tác của các nền văn hóa nổi tiếng như Văn hóa Đông Sơn, Điêu khắc đá Chăm-pa",
  activityTimetable: [
    ActivityTimetable(
        dayOfWeek: "Thứ Hai", openTime: "07:30 - 11:30 và 13:00 - 19:00"),
    ActivityTimetable(
        dayOfWeek: "Thứ Ba", openTime: "07:30 - 11:30 và 13:00 - 19:00"),
    ActivityTimetable(
        dayOfWeek: "Thứ Tư", openTime: "07:30 - 11:30 và 13:00 - 19:00"),
    ActivityTimetable(
        dayOfWeek: "Thứ Năm", openTime: "07:30 - 11:30 và 13:00 - 19:00"),
    ActivityTimetable(
        dayOfWeek: "Thứ Sáu", openTime: "07:30 - 11:30 và 13:00 - 19:00"),
    ActivityTimetable(dayOfWeek: "Thứ Bảy", openTime: "07:30 - 17:30"),
    ActivityTimetable(dayOfWeek: "Chủ Nhật", openTime: "07:30 - 17:30"),
  ],
  moreImages: [
    "assets/images/bao_tang_LSQG/bao_tang_LSQG_2.jpg",
    "assets/images/bao_tang_LSQG/bao_tang_LSQG_3.jpg",
    "assets/images/bao_tang_LSQG/bao_tang_LSQG_4.jpg",
  ],
  city: haNoiCity,
  travelTime: 26,
  travelDistance: 4.2,
  overallRating: 4.8,
  visitedCounter: 167,
  isPopular: true,
);
//5. Công viên nước Hồ Tây

Activity congVienNuocHoTay = Activity(
  name: "Công viên nước Hồ Tây",
  shortName: "Công viên nước Hồ Tây",
  image: "assets/images/cong_vien_nuoc_Ho_Tay/cong_vien_nuoc_HT_1.jpg",
  address: "614 Lạc Long Quân, quận Tây Hồ, Hà Nội",
  briefDescription:
      "Không chỉ có những khu di tích lịch sử lâu đời hay những danh lam thắng cảnh đẹp, Hà Nội – một trong những thành phố lớn nhất Việt Nam còn có những trung tâm thương mại sầm uất, những công viên giải trí hiện đại với vô số các trò chơi hấp dẫn",
  detailedDescription:
      "Thủy cung Hà Nội là một trong những điểm đến được yêu thích tại thủ đô. Với không gian thủy cung hoành tráng cùng hàng ngàn loài sinh vật biển độc đáo. Thủy cung Vinpearl Land Aquarium đã trở thành một điểm đến hấp dẫn và hút khách nhất",
  activityTimetable: [
    ActivityTimetable(
        dayOfWeek: "Thứ Hai", openTime: "07:30 - 11:30 và 13:00 - 19:00"),
    ActivityTimetable(
        dayOfWeek: "Thứ Ba", openTime: "07:30 - 11:30 và 13:00 - 19:00"),
    ActivityTimetable(
        dayOfWeek: "Thứ Tư", openTime: "07:30 - 11:30 và 13:00 - 19:00"),
    ActivityTimetable(
        dayOfWeek: "Thứ Năm", openTime: "07:30 - 11:30 và 13:00 - 19:00"),
    ActivityTimetable(
        dayOfWeek: "Thứ Sáu", openTime: "07:30 - 11:30 và 13:00 - 19:00"),
    ActivityTimetable(dayOfWeek: "Thứ Bảy", openTime: "07:30 - 17:30"),
    ActivityTimetable(dayOfWeek: "Chủ Nhật", openTime: "07:30 - 17:30"),
  ],
  moreImages: [
    "assets/images/cong_vien_nuoc_Ho_Tay/cong_vien_nuoc_HT_2.jpg",
    "assets/images/cong_vien_nuoc_Ho_Tay/cong_vien_nuoc_HT_3.jpg",
    "assets/images/cong_vien_nuoc_Ho_Tay/cong_vien_nuoc_HT_4.jpg",
  ],
  city: haNoiCity,
  travelTime: 26,
  travelDistance: 4.2,
  overallRating: 4.8,
  visitedCounter: 167,
  isPopular: true,
);

//6. Tòa nhà Keangnam Hà Nội

Activity keangnamHN = Activity(
  name: "Tòa nhà Keangnam Hà Nội",
  shortName: "Tòa nhà Keangnam Hà Nội",
  image: "assets/images/landmark_72/landmark72_1.jpg",
  address: "Khu E6 Đô thị mới Cầu Giấy, Phạm Hùng, Mễ Trì, Nam Từ Liêm, Hà Nội",
  briefDescription:
      "Keangnam Hanoi Landmark Tower là một khu phức hợp gồm 3 cao ốc khách sạn-văn phòng-căn hộ-trung tâm thương mại tại đường Phạm Hùng, quận Nam Từ Liêm, Hà Nội, tổ hợp này được đầu tư và xây dựng bởi tập đoàn Keangnam – tập đoàn đa quốc gia có trụ sở chính tại Dongdaemun-gu, Seoul, Hàn Quốc",
  detailedDescription:
      "Landmark 72 với diện tích hơn 300 000m2 là tòa nhà cao nhất Việt Nam từ năm 2010-2018 (350m), nơi đây có thể được coi là biểu tượng cho sự tăng trưởng kinh tế của Việt Nam, đặc biệt là sự tăng trưởng về xây dựng cũng như ngành công nghiệp dịch vụ, những ngành đang thúc đẩy mạnh mẽ sự phát triển của thành phố Hà Nội.",
  activityTimetable: [
    ActivityTimetable(
        dayOfWeek: "Thứ Hai", openTime: "07:30 - 11:30 và 13:00 - 19:00"),
    ActivityTimetable(
        dayOfWeek: "Thứ Ba", openTime: "07:30 - 11:30 và 13:00 - 19:00"),
    ActivityTimetable(
        dayOfWeek: "Thứ Tư", openTime: "07:30 - 11:30 và 13:00 - 19:00"),
    ActivityTimetable(
        dayOfWeek: "Thứ Năm", openTime: "07:30 - 11:30 và 13:00 - 19:00"),
    ActivityTimetable(
        dayOfWeek: "Thứ Sáu", openTime: "07:30 - 11:30 và 13:00 - 19:00"),
    ActivityTimetable(dayOfWeek: "Thứ Bảy", openTime: "07:30 - 17:30"),
    ActivityTimetable(dayOfWeek: "Chủ Nhật", openTime: "07:30 - 17:30"),
  ],
  moreImages: [
    "assets/images/landmark_72/landmark72_4.jpg",
    "assets/images/landmark_72/landmark72_2.jpg",
    "assets/images/landmark_72/landmark72_3.jpg",
  ],
  city: haNoiCity,
  travelTime: 26,
  travelDistance: 4.2,
  overallRating: 4.8,
  visitedCounter: 167,
  isPopular: true,
);

//2. Đà Nẵng
// 1. Bà Nà Hills

Activity baNaHills = Activity(
  name: "Tham quan trọn gói Bà Nà Hills Đà Nẵng",
  shortName: "Bà Nà Hills Đà Nẵng",
  image: "assets/images/banahill.jpg",
  address: "Thôn An Sơn, xã Hòa Ninh, huyện Hòa Vang, Đà Nẵng",
  briefDescription:
      "Thưởng thức cảnh sắc thuyệt vời cùng gần 100 trò chơi thú vị",
  detailedDescription:
      "Nằm ở độ cao 1.487m so với mực nước biển, Sun World Ba Na Hills được mênh danh là “chốn bồng lai tiên cảnh”, " +
          "sở hữu khí hậu tuyệt vời cùng cảnh quan thiên nhiên kỳ thú",
  activityTimetable: [
    ActivityTimetable(dayOfWeek: "Thứ Hai", openTime: "08:00 - 17:00"),
    ActivityTimetable(dayOfWeek: "Thứ Ba", openTime: "08:00 - 17:00"),
    ActivityTimetable(dayOfWeek: "Thứ Tư", openTime: "08:00 - 17:00"),
    ActivityTimetable(dayOfWeek: "Thứ Năm", openTime: "08:00 - 17:00"),
    ActivityTimetable(dayOfWeek: "Thứ Sáu", openTime: "08:00 - 17:00"),
    ActivityTimetable(dayOfWeek: "Thứ Bảy", openTime: "08:00 - 17:00"),
    ActivityTimetable(dayOfWeek: "Chủ Nhật", openTime: "08:00 - 17:00"),
  ],
  moreImages: [
    "assets/images/banahill_1.jpg",
    "assets/images/banahill_2.jpg",
    "assets/images/banahill_3.jpg",
  ],
  city: daNangCity,
  overallRating: 4.6,
  visitedCounter: 237,
  isPopular: true,
);

//2. Triển lãm tranh 3D
Activity artInParadise = Activity(
  briefDescription:
      "Hóa thân thành những nhân vật cổ tích trong triển lãm tranh 3D",
  detailedDescription:
      "Không chỉ được chiêm ngưỡng các tác phẩm 3D, hoạt động thú vị và chủ yếu ở Art in Paradise chính là tạo dáng và chụp ảnh. Bạn có thể hóa thân thành những nhân vật cổ tích trong thế giới thần tiên, đặt chân vào khu rừng bí ẩn giữa những lăng mộ Ai Cập cổ đại hay hóa thân thành những chú chim đại bàng tung cánh…",
  name: "Lạc vào thế giới tranh 3D cùng Bảo tàng Art in Paradise",
  shortName: "Bảo tàng 3D Art in Paradise",
  image: "assets/images/art_in_paradise/art_in_paradise.jpeg",
  address:
      "Lô C2-10 đường Trần Nhân Tông, phường Thọ Quang, quận Sơn Trà, Đà Nẵng",
  moreImages: [
    "assets/images/art_in_paradise/art_in_paradise1.jpeg",
    "assets/images/art_in_paradise/art_in_paradise2.jpeg",
    "assets/images/art_in_paradise/art_in_paradise3.jpeg",
    "assets/images/art_in_paradise/art_in_paradise4.jpeg"
  ],
  city: daNangCity,
  visitedCounter: 345,
  overallRating: 3.6,
  activityTimetable: [
    ActivityTimetable(dayOfWeek: "Thứ Hai", openTime: "07:00 - 17:00"),
    ActivityTimetable(dayOfWeek: "Thứ Ba", openTime: "07:00 - 17:00"),
    ActivityTimetable(dayOfWeek: "Thứ Tư", openTime: "07:00 - 17:00"),
    ActivityTimetable(dayOfWeek: "Thứ Năm", openTime: "07:00 - 17:00"),
    ActivityTimetable(dayOfWeek: "Thứ Sáu", openTime: "07:00 - 17:00"),
    ActivityTimetable(dayOfWeek: "Thứ Bảy", openTime: "07:00 - 17:00"),
    ActivityTimetable(dayOfWeek: "Chủ Nhật", openTime: "07:00 - 17:00"),
  ],
);
//3.Asia Park – Sunworld Đà Nẵng Wonders
Activity sunWorldDN = Activity(
  name: "Asia Park – Sunworld Đà Nẵng Wonders",
  shortName: "Asia Park",
  image: "assets/images/asiaWorld/asiaWorld_1.jpg",
  address: "1 Phan Đăng Lưu, Hoà Cường Bắc, Hải Châu, Đà Nẵng",
  briefDescription:
      "Được mệnh danh là kỳ quan nhân tạo của Đà Nẵng, Asia Park sở hữu hệ thống các trò chơi và giải trí cực kỳ hấp dẫn.",
  detailedDescription:
      "Bạn có thể đi monorail ngắm cảnh công viên, hoặc lên ngay cabin Sunwheel để ngắm Đà Nẵng cả đêm lẫn ngày.",
  activityTimetable: [
    ActivityTimetable(
        dayOfWeek: "Thứ Hai", openTime: "07:30 - 11:30 và 13:00 - 19:00"),
    ActivityTimetable(
        dayOfWeek: "Thứ Ba", openTime: "07:30 - 11:30 và 13:00 - 19:00"),
    ActivityTimetable(
        dayOfWeek: "Thứ Tư", openTime: "07:30 - 11:30 và 13:00 - 19:00"),
    ActivityTimetable(
        dayOfWeek: "Thứ Năm", openTime: "07:30 - 11:30 và 13:00 - 19:00"),
    ActivityTimetable(
        dayOfWeek: "Thứ Sáu", openTime: "07:30 - 11:30 và 13:00 - 19:00"),
    ActivityTimetable(dayOfWeek: "Thứ Bảy", openTime: "07:30 - 17:30"),
    ActivityTimetable(dayOfWeek: "Chủ Nhật", openTime: "07:30 - 17:30"),
  ],
  moreImages: [
    "assets/images/asiaWorld/asiaWorld_2.jpg",
    "assets/images/asiaWorld/asiaWorld_3.jpg",
    "assets/images/asiaWorld/asiaWorld_4.jpg",
  ],
  city: daNangCity,
  travelTime: 26,
  travelDistance: 4.2,
  overallRating: 4.8,
  visitedCounter: 167,
  isPopular: true,
);

//4.Suối khoáng Thần Tài
Activity suoiKhoangThanTai = Activity(
  name: "Suối khoáng Thần Tài",
  shortName: "Suối khoáng Thần Tài",
  image: "assets/images/suoi_khoang_than_tai/sktt_1.jpg",
  address:
      "Công viên suối khoáng nóng Núi Thần Tài – QL14G xã Hòa Phú, huyện Hòa Vang, Đà Nẵng",
  briefDescription:
      "Suối khoáng Thần Tài có cảnh sắc thiên nhiên xinh đẹp kết hợp việc sở hữu dòng suối khoáng độc đáo nằm trong khu du lịch sinh thái bảo tồn Bà Nà Núi Chúa.",
  detailedDescription:
      "Tại đây, bạn có thể chiêm ngưỡng, khám phá nét đẹp hùng vĩ của núi rừng cũng như hòa mình, thư giãn cùng những dịch vụ hấp dẫn như tắm bùn, tắm rượu vang,…",
  activityTimetable: [
    ActivityTimetable(
        dayOfWeek: "Thứ Hai", openTime: "07:30 - 11:30 và 13:00 - 19:00"),
    ActivityTimetable(
        dayOfWeek: "Thứ Ba", openTime: "07:30 - 11:30 và 13:00 - 19:00"),
    ActivityTimetable(
        dayOfWeek: "Thứ Tư", openTime: "07:30 - 11:30 và 13:00 - 19:00"),
    ActivityTimetable(
        dayOfWeek: "Thứ Năm", openTime: "07:30 - 11:30 và 13:00 - 19:00"),
    ActivityTimetable(
        dayOfWeek: "Thứ Sáu", openTime: "07:30 - 11:30 và 13:00 - 19:00"),
    ActivityTimetable(dayOfWeek: "Thứ Bảy", openTime: "07:30 - 17:30"),
    ActivityTimetable(dayOfWeek: "Chủ Nhật", openTime: "07:30 - 17:30"),
  ],
  moreImages: [
    "assets/images/suoi_khoang_than_tai/sktt_2.jpg",
    "assets/images/suoi_khoang_than_tai/sktt_3.jpg",
    "assets/images/suoi_khoang_than_tai/sktt_4.jpg",
  ],
  city: daNangCity,
  travelTime: 26,
  travelDistance: 4.2,
  overallRating: 4.8,
  visitedCounter: 167,
  isPopular: true,
);

//5. Bảo tàng 3D
Activity baoTang3D = Activity(
  name: "Bảo tàng 3D TrickEye",
  shortName: "Bảo tàng 3D TrickEye",
  image: "assets/images/bao_tang_3D/bao_tang_3D.jpg",
  address:
      "Art in Paradise Đà Nẵng, Lô C2-10 đường Trần Nhân Tông, phường Thọ Quang, quận Sơn Trà, thành phố Đà Nẵng",
  briefDescription:
      "Không chỉ được chiêm ngưỡng các tác phẩm 3D, hoạt động thú vị và chủ yếu ở Art in Paradise chính là tạo dáng và chụp ảnh.",
  detailedDescription:
      "Bạn có thể hóa thân thành những nhân vật cổ tích trong thế giới thần tiên, đặt chân vào khu rừng bí ẩn giữa những lăng mộ Ai Cập cổ đại hay hóa thân thành những chú chim đại bàng tung cánh",
  activityTimetable: [
    ActivityTimetable(
        dayOfWeek: "Thứ Hai", openTime: "07:30 - 11:30 và 13:00 - 19:00"),
    ActivityTimetable(
        dayOfWeek: "Thứ Ba", openTime: "07:30 - 11:30 và 13:00 - 19:00"),
    ActivityTimetable(
        dayOfWeek: "Thứ Tư", openTime: "07:30 - 11:30 và 13:00 - 19:00"),
    ActivityTimetable(
        dayOfWeek: "Thứ Năm", openTime: "07:30 - 11:30 và 13:00 - 19:00"),
    ActivityTimetable(
        dayOfWeek: "Thứ Sáu", openTime: "07:30 - 11:30 và 13:00 - 19:00"),
    ActivityTimetable(dayOfWeek: "Thứ Bảy", openTime: "07:30 - 17:30"),
    ActivityTimetable(dayOfWeek: "Chủ Nhật", openTime: "07:30 - 17:30"),
  ],
  moreImages: [
    "assets/images/bao_tang_3D/bao_tang_3D_2.jpg",
    "assets/images/bao_tang_3D/bao_tang_3D_3.jpg",
    "assets/images/bao_tang_3D/bao_tang_3D_4.jpg",
  ],
  city: daNangCity,
  travelTime: 26,
  travelDistance: 4.2,
  overallRating: 4.8,
  visitedCounter: 167,
  isPopular: true,
);

//6. Ngôi nhà úp ngược
Activity upsideDownHouse = Activity(
  name: "Ngôi nhà úp ngược",
  shortName: "Ngôi nhà úp ngược",
  image: "assets/images/ngoi_nha_up_nguoc/nha_up_nguoc_1.jpg",
  address:
      "Art in Paradise Đà Nẵng, Lô C2-10 đường Trần Nhân Tông, phường Thọ Quang, quận Sơn Trà, thành phố Đà Nẵng",
  briefDescription:
      "Úp ngược mọi thứ là một ý tưởng phổ biến đã có từ lâu trên thế giới. Và mô hình nhà úp ngược trong đó mọi vật dụng đều được thiết kế như thể tất cả đều úp ngược. ",
  detailedDescription:
      " Tại Việt Nam, mô hình nhà úp ngược này đã có tại Vũng Tàu, Đà Lạt, Đà Nẵng và Sài Gòn. Điểm chung của những ngôi nhà này là các đồ vật và cả căn nhà dường như bị xoay ngược, phá vỡ các quy luật thông thường về vị trí của con người.",
  activityTimetable: [
    ActivityTimetable(
        dayOfWeek: "Thứ Hai", openTime: "07:30 - 11:30 và 13:00 - 19:00"),
    ActivityTimetable(
        dayOfWeek: "Thứ Ba", openTime: "07:30 - 11:30 và 13:00 - 19:00"),
    ActivityTimetable(
        dayOfWeek: "Thứ Tư", openTime: "07:30 - 11:30 và 13:00 - 19:00"),
    ActivityTimetable(
        dayOfWeek: "Thứ Năm", openTime: "07:30 - 11:30 và 13:00 - 19:00"),
    ActivityTimetable(
        dayOfWeek: "Thứ Sáu", openTime: "07:30 - 11:30 và 13:00 - 19:00"),
    ActivityTimetable(dayOfWeek: "Thứ Bảy", openTime: "07:30 - 17:30"),
    ActivityTimetable(dayOfWeek: "Chủ Nhật", openTime: "07:30 - 17:30"),
  ],
  moreImages: [
    "assets/images/ngoi_nha_up_nguoc/nha_up_nguoc_2.jpg",
    "assets/images/ngoi_nha_up_nguoc/nha_up_nguoc_3.jpg",
    "assets/images/ngoi_nha_up_nguoc/nha_up_nguoc_4.jpg",
  ],
  city: daNangCity,
  travelTime: 26,
  travelDistance: 4.2,
  overallRating: 4.8,
  visitedCounter: 167,
  isPopular: true,
);

//3. Ho Chi Minh
//1. Thao Cam Vien

Activity thaoCamVien = Activity(
  name: "Tham quan Thảo Cầm Viên",
  shortName: "Thảo Cầm Viên",
  image: "assets/images/thao_cam_vien.jpg",
  address: "2 Nguyễn Bỉnh Khiêm, Bến Nghé, Quận 1, Thành phố Hồ Chí Minh",
  briefDescription: "Tìm hiểu hơn 1000 cá thể động, thực vật khác nhau",
  detailedDescription:
      "Không chỉ là một công viên giải trí lành mạnh với không khí trong lành và hệ động thực vật phong phú, " +
          "Thảo Cầm Viên Sài Gòn còn giữ vai trò quan trọng trong việc giáo dục, bảo tồn và nghiên cứu về tự nhiên",
  activityTimetable: [
    ActivityTimetable(
        dayOfWeek: "Thứ Hai", openTime: "07:30 - 11:30 và 13:00 - 19:00"),
    ActivityTimetable(
        dayOfWeek: "Thứ Ba", openTime: "07:30 - 11:30 và 13:00 - 19:00"),
    ActivityTimetable(
        dayOfWeek: "Thứ Tư", openTime: "07:30 - 11:30 và 13:00 - 19:00"),
    ActivityTimetable(
        dayOfWeek: "Thứ Năm", openTime: "07:30 - 11:30 và 13:00 - 19:00"),
    ActivityTimetable(
        dayOfWeek: "Thứ Sáu", openTime: "07:30 - 11:30 và 13:00 - 19:00"),
    ActivityTimetable(dayOfWeek: "Thứ Bảy", openTime: "07:30 - 17:30"),
    ActivityTimetable(dayOfWeek: "Chủ Nhật", openTime: "07:30 - 17:30"),
  ],
  moreImages: [
    "assets/images/thao_cam_vien_1.jpg",
    "assets/images/thao_cam_vien_2.jpg",
    "assets/images/thao_cam_vien_3.jpg",
  ],
  city: hcmCity,
  travelTime: 26,
  travelDistance: 4.2,
  overallRating: 4.8,
  visitedCounter: 167,
  isPopular: true,
);

//2. Dinh Doc Lap

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
    ActivityTimetable(dayOfWeek: "Thứ Hai", openTime: "08:00 - 13:00"),
    ActivityTimetable(dayOfWeek: "Thứ Ba", openTime: "08:00 - 13:00"),
    ActivityTimetable(dayOfWeek: "Thứ Tư", openTime: "08:00 - 13:00"),
    ActivityTimetable(dayOfWeek: "Thứ Năm", openTime: "08:00 - 13:00"),
    ActivityTimetable(dayOfWeek: "Thứ Sáu", openTime: "08:00 - 13:00"),
    ActivityTimetable(dayOfWeek: "Thứ Bảy", openTime: "08:00 - 16:00"),
    ActivityTimetable(dayOfWeek: "Chủ Nhật", openTime: "08:00 - 16:00"),
  ],
  moreImages: [
    "assets/images/dinh_doc_lap_1.jpg",
    "assets/images/dinh_doc_lap_2.jpg",
    "assets/images/dinh_doc_lap_3.jpg",
  ],
  city: hcmCity,
  travelTime: 29,
  travelDistance: 4.7,
  overallRating: 4.3,
  visitedCounter: 120,
);

//3. Dia Dao Cu Chi

Activity diadaoCuChi = Activity(
  name: "Tham quan Địa đạo Củ Chi",
  shortName: "Địa đạo Củ Chi",
  image: "assets/images/dia_dao_cu_chi.jpg",
  address: "Đường Tỉnh Lộ 15, Phú Hiệp, Củ Chi, Thành phố Hồ Chí Minh",
  briefDescription: "Tham quan hệ thống đường hầm dài đến 220km",
  detailedDescription:
      "Địa đạo Củ Chi là một hệ thống phòng thủ trong lòng đất ở huyện Củ Chi. Hệ thống này được " +
          "quân kháng chiến Việt Minh và Mặt trận Dân tộc Giải phóng miền Nam Việt Nam " +
          "đào trong thời kỳ Chiến tranh Đông Dương và Chiến tranh Việt Nam.",
  activityTimetable: [
    ActivityTimetable(dayOfWeek: "Thứ Hai", openTime: "07:00 - 17:00"),
    ActivityTimetable(dayOfWeek: "Thứ Ba", openTime: "07:00 - 17:00"),
    ActivityTimetable(dayOfWeek: "Thứ Tư", openTime: "07:00 - 17:00"),
    ActivityTimetable(dayOfWeek: "Thứ Năm", openTime: "07:00 - 17:00"),
    ActivityTimetable(dayOfWeek: "Thứ Sáu", openTime: "07:00 - 17:00"),
    ActivityTimetable(dayOfWeek: "Thứ Bảy", openTime: "07:00 - 17:00"),
    ActivityTimetable(dayOfWeek: "Chủ Nhật", openTime: "07:00 - 17:00"),
  ],
  moreImages: [
    "assets/images/dia_dao_cu_chi_1.jpg",
    "assets/images/dia_dao_cu_chi_2.jpg",
    "assets/images/dia_dao_cu_chi_3.jpg",
  ],
  city: hcmCity,
  travelTime: 33,
  travelDistance: 6.2,
  overallRating: 4.9,
  visitedCounter: 132,
  isNew: true,
);

//4. Bao Tang Mi Thuat

Activity baoTangMyThuat = Activity(
    briefDescription:
        "Điểm dừng chân lý tưởng cho những tâm hồn yêu văn hóa và đam mê nghệ thuật",
    detailedDescription:
        "Nếu có ai là “người hâm mộ” của phong cách vintage, của những tấm ảnh phim thì nhất định phải một lần ghé thăm nơi đây. Ta có thể ví bảo tàng mỹ thuật Hồ Chí Minh như là một chiều không gian xưa cũ, nơi thời gian dừng trôi, lấy màu vàng làm tông màu chính. Từ cổng chính bước vào, bạn sẽ dễ dàng nhận thấy cả tòa nhà là một công trình kiến trúc đồ sộ màu vàng nằm giữa không gian xanh mát rộng lớn. \n\nKhi bước dọc theo những hành lang, màu vàng dần biến mất và thay vào đó là gam màu xám xịt của bức tường, của những song cửa sổ hai bên. Bạn sẽ phản bác rằng màu xám là một tông màu hiện đại cơ mà, nhưng không, trong không gian của bảo tàng, gam màu này như đánh mất sự máy móc lạnh lẽo vốn có của mình mà lại đượm sắc thái nhàn nhạt của quá khứ, về một thời đã qua.\n\n",
    name: "Tham quan Bảo tàng Mỹ thuật TP HCM",
    shortName: "Bảo tàng Mỹ thuật TP HCM",
    image: "assets/images/bao_tang_my_thuat/bao_tang_my_thuat.jpg",
    address:
        "97A Phó Đức Chính, Phường Nguyễn Thái Bình, Quận 1, Thành phố Hồ Chí Minh",
    activityTimetable: [
      ActivityTimetable(dayOfWeek: "Thứ Hai", openTime: "07:00 - 17:00"),
      ActivityTimetable(dayOfWeek: "Thứ Ba", openTime: "07:00 - 17:00"),
      ActivityTimetable(dayOfWeek: "Thứ Tư", openTime: "07:00 - 17:00"),
      ActivityTimetable(dayOfWeek: "Thứ Năm", openTime: "07:00 - 17:00"),
      ActivityTimetable(dayOfWeek: "Thứ Sáu", openTime: "07:00 - 17:00"),
      ActivityTimetable(dayOfWeek: "Thứ Bảy", openTime: "07:00 - 17:00"),
      ActivityTimetable(dayOfWeek: "Chủ Nhật", openTime: "07:00 - 17:00"),
    ],
    moreImages: [
      "assets/images/bao_tang_my_thuat/bao-tang-my-thuat-1.jpg",
      "assets/images/bao_tang_my_thuat/bao-tang-my-thuat-2.jpg",
      "assets/images/bao_tang_my_thuat/bao-tang-my-thuat-3.jpg",
      "assets/images/bao_tang_my_thuat/bao-tang-my-thuat-4.jpg"
    ],
    city: hcmCity,
    visitedCounter: 254,
    overallRating: 3.7,
    isPopular: true,
    travelDistance: 5.8,
    travelTime: 30);

//5. Bao tang Y Duoc
Activity baoTangYDuoc = Activity(
    briefDescription:
        "Tòa nhà của bảo tàng gồm một trệt 6 lầu gồm 18 phòng cho khách tham quan với tổng diện tích gần 600 mét vuông, nội thất được xây dựng chủ yếu từ nguyên liệu gỗ theo phong cách kiến trúc truyền thống Việt Nam.",
    detailedDescription:
        "Bảo tàng được trang bị nghe nhìn hiện đại. Khách tham quan được xem bộ phim tài liệu Kinh nghiệm thế kỷ phục vụ sức khỏe giới thiệu về lịch sử y học cổ truyền Việt Nam.\n\n",
    name: "Bảo tàng Y Học Cổ Truyền Việt Nam",
    shortName: "Bảo tàng Y Học Cổ Truyền Việt Nam",
    image: "assets/images/bao_tang_y_duoc/btyd_1.jpg",
    address: "41 Hoàng Dư Khương, Phường 12, Quận 10, Thành phố Hồ Chí Minh",
    activityTimetable: [
      ActivityTimetable(dayOfWeek: "Thứ Hai", openTime: "07:00 - 17:00"),
      ActivityTimetable(dayOfWeek: "Thứ Ba", openTime: "07:00 - 17:00"),
      ActivityTimetable(dayOfWeek: "Thứ Tư", openTime: "07:00 - 17:00"),
      ActivityTimetable(dayOfWeek: "Thứ Năm", openTime: "07:00 - 17:00"),
      ActivityTimetable(dayOfWeek: "Thứ Sáu", openTime: "07:00 - 17:00"),
      ActivityTimetable(dayOfWeek: "Thứ Bảy", openTime: "07:00 - 17:00"),
      ActivityTimetable(dayOfWeek: "Chủ Nhật", openTime: "07:00 - 17:00"),
    ],
    moreImages: [
      "assets/images/bao_tang_y_duoc/btyd_2.jpg",
      "assets/images/bao_tang_y_duoc/btyd_4.jpg",
      "assets/images/bao_tang_y_duoc/btyd_5.jpg",
      "assets/images/bao_tang_y_duoc/btyd_6.jpg"
    ],
    city: hcmCity,
    visitedCounter: 254,
    overallRating: 4.5,
    isNew: true,
    travelDistance: 6.5,
    travelTime: 35);
//6. Dam Sen
Activity damSen = Activity(
  briefDescription:
      "Công viên Văn hoá Đầm Sen là công viên giải trí nằm trên đường Hòa Bình, Quận 11, Thành phố Hồ Chí Minh",
  detailedDescription:
      "Công viên có diện tích 50 hecta gồm 20% là mặt hồ và 60% cây xanh và vườn hoa.",
  name: "Công viên Văn hóa Đầm Sen",
  shortName: "Công viên Văn hóa Đầm Sen",
  image: "assets/images/dam_sen/dam_sen_1.jpg",
  address: "Số 3 Hòa Bình, Phường 3, Quận 11, Thành phố Hồ Chí Minh",
  activityTimetable: [
    ActivityTimetable(dayOfWeek: "Thứ Hai", openTime: "07:00 - 17:00"),
    ActivityTimetable(dayOfWeek: "Thứ Ba", openTime: "07:00 - 17:00"),
    ActivityTimetable(dayOfWeek: "Thứ Tư", openTime: "07:00 - 17:00"),
    ActivityTimetable(dayOfWeek: "Thứ Năm", openTime: "07:00 - 17:00"),
    ActivityTimetable(dayOfWeek: "Thứ Sáu", openTime: "07:00 - 17:00"),
    ActivityTimetable(dayOfWeek: "Thứ Bảy", openTime: "07:00 - 17:00"),
    ActivityTimetable(dayOfWeek: "Chủ Nhật", openTime: "07:00 - 17:00"),
  ],
  moreImages: [
    "assets/images/dam_sen/dam_sen_5.jpg",
    "assets/images/dam_sen/dam_sen_2.jpg",
    "assets/images/dam_sen/dam_sen_3.jpg",
    "assets/images/dam_sen/dam_sen_4.jpg"
  ],
  city: hcmCity,
  visitedCounter: 254,
  overallRating: 3.9,
  isPopular: true,
  isNew: true,
  travelDistance: 7.2,
  travelTime: 45,
);
//7. Suoi Tien
Activity suoiTien = Activity(
  briefDescription:
      "Khu Du lịch Văn hóa Suối Tiên là một công viên liên hợp vui chơi giải trí kết hợp truyền thống các yếu tố văn hóa - lịch sử - tâm linh.",
  detailedDescription:
      "Suối Tiên của chúng ta là Miền Đất Tứ Linh với Long – Lân – Quy – Phụng" +
          "Nơi an lành, hạnh phúc, luôn mang lại nhiều may mắn cho gia đình bạn.",
  name: "Suoi Tien Theme Park",
  shortName: "Suoi Tien Theme Park",
  image: "assets/images/suoi_tien/st_1.jpg",
  address: "120 Xa lộ Hà Nội, Phường Tân Phú, Quận 9, Thành phố Hồ Chí Minh",
  activityTimetable: [
    ActivityTimetable(dayOfWeek: "Thứ Hai", openTime: "07:00 - 17:00"),
    ActivityTimetable(dayOfWeek: "Thứ Ba", openTime: "07:00 - 17:00"),
    ActivityTimetable(dayOfWeek: "Thứ Tư", openTime: "07:00 - 17:00"),
    ActivityTimetable(dayOfWeek: "Thứ Năm", openTime: "07:00 - 17:00"),
    ActivityTimetable(dayOfWeek: "Thứ Sáu", openTime: "07:00 - 17:00"),
    ActivityTimetable(dayOfWeek: "Thứ Bảy", openTime: "07:00 - 17:00"),
    ActivityTimetable(dayOfWeek: "Chủ Nhật", openTime: "07:00 - 17:00"),
  ],
  moreImages: [
    "assets/images/suoi_tien/st_2.jpg",
    "assets/images/suoi_tien/st_3.jpg",
    "assets/images/suoi_tien/st_4.jpg",
    "assets/images/suoi_tien/st_5.jpg"
  ],
  city: hcmCity,
  visitedCounter: 254,
  overallRating: 3.5,
  isPopular: true,
  travelDistance: 3.1,
  travelTime: 20
);
List<Activity> mockupActivities = [
//1. Ha Noi
  baaraLand,
  vanMieuQuocTuGiam,
  baoTangHN,
  baotangLSQG,
  congVienNuocHoTay,
  keangnamHN,
//2. Da Nang
  baNaHills,
  artInParadise,
  sunWorldDN,
  suoiKhoangThanTai,
  baoTang3D,
  upsideDownHouse,
//3. HCM
  thaoCamVien,
  dinhDocLap,
  diadaoCuChi,
  baoTangMyThuat,
  baoTangYDuoc,
  damSen,
  suoiTien
];

List<Activity> mockupNearYouActivities_1 = [
  //1. Ha Noi
  baaraLand,
  vanMieuQuocTuGiam,
  baoTangHN,
  baotangLSQG,
  congVienNuocHoTay,
  keangnamHN,
];

List<Activity> mockupNearYouActivities_2 = [
//2. Da Nang
  baNaHills,
  artInParadise,
  sunWorldDN,
  suoiKhoangThanTai,
  baoTang3D,
  upsideDownHouse,
];

List<Activity> mockupNearYouActivities_3 = [
//3. HCM
  thaoCamVien,
  dinhDocLap,
  diadaoCuChi,
  baoTangMyThuat,
  baoTangYDuoc,
  damSen,
  suoiTien
];
