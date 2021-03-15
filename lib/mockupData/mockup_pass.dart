import 'package:city_pass/mockupData/mockup_activity.dart';
import 'package:city_pass/mockupData/mockup_city.dart';
import 'package:city_pass/models/pass.dart';

// 1. HaNoi

Pass haNoiPass_1 = Pass(
  name: "Nghĩ dưỡng tại Thủ Đô",
  image: "assets/images/baraland/bara_2.jpg",
  overallRating: 4.9,
  price: 820000,
  originalPrice: 1500000,
  includingDestination: [
    IncludingDestination([baaraLand, keangnamHN], 2),
    IncludingDestination([
      vanMieuQuocTuGiam,
      baoTangHN,
      congVienNuocHoTay,
    ], 2),
  ],
  city: haNoiCity,
  isGoodSeller: true,
);

Pass haNoiPass_2 = Pass(
  name: "Khám phá nền Quốc Tự Giám",
  image: "assets/images/van_mieu_quoc_tu_giam/quoc_tu_giam_1.jpg",
  overallRating: 4.7,
  price: 580000,
  originalPrice: 900000,
  includingDestination: [
    IncludingDestination([baoTangHN], 1),
    IncludingDestination([
      vanMieuQuocTuGiam,
      congVienNuocHoTay,
    ], 2),
  ],
  city: haNoiCity,
  isGoodSeller: true,
);

Pass haNoiPass_3 = Pass(
  name: "Thủ Đô Special Trip",
  image: "assets/images/landmark_72/landmark72_4.jpg",
  overallRating: 4.9,
  price: 600000,
  originalPrice: 1600000,
  includingDestination: [
    IncludingDestination([
      congVienNuocHoTay,
    ], 1),
    IncludingDestination([
      baaraLand,
      vanMieuQuocTuGiam,
      keangnamHN,
    ], 2),
  ],
  city: haNoiCity,
  isGoodSeller: true,
);

Pass haNoiPass_4 = Pass(
  name: "Du lịch Hà Nội - Siêu Khuyến Mãi",
  image: "assets/images/bao_tang_HN/bao_tang_HN_2.jpg",
  overallRating: 4.6,
  price: 500000,
  originalPrice: 800000,
  includingDestination: [
    IncludingDestination([
      vanMieuQuocTuGiam,
    ], 1),
    IncludingDestination([
      baotangLSQG,
      baoTangHN,
      congVienNuocHoTay,
    ], 2),
  ],
  city: haNoiCity,
  isGoodSeller: true,
);

//2. Đà Nẵng
Pass daNangPass_1 = Pass(
  name: "Kì nghỉ ở Đà Nẵng",
  image: "assets/images/banahill.jpg",
  overallRating: 4.9,
  price: 1000000,
  originalPrice: 1200000,
  includingDestination: [
    IncludingDestination(
        [suoiKhoangThanTai, artInParadise, upsideDownHouse], 2),
  ],
  city: daNangCity,
  isGoodSeller: true,
);

Pass daNangPass_2 = Pass(
  name: "Thành phố Biển Đà Nẵng",
  image: "assets/images/asiaWorld/asiaWorld_3.jpg",
  overallRating: 4.9,
  price: 1200000,
  originalPrice: 2000000,
  includingDestination: [
    IncludingDestination([baNaHills, artInParadise, sunWorldDN], 2),
  ],
  city: daNangCity,
  isGoodSeller: true,
);

Pass daNangPass_3 = Pass(
  name: "Khám phá Cầu Bàn Tay",
  image: "assets/images/suoi_khoang_than_tai/sktt_3.jpg",
  overallRating: 4.6,
  price: 600000,
  originalPrice: 1300000,
  includingDestination: [
    IncludingDestination([
      baNaHills,
      artInParadise,
      baoTang3D,
      upsideDownHouse,
    ], 2),
  ],
  city: daNangCity,
  isGoodSeller: true,
);

Pass daNangPass_4 = Pass(
  name: "Thành phố bên Sông Hàn",
  image: "assets/images/banahill_2.jpg",
  overallRating: 4.9,
  price: 780000,
  originalPrice: 1200000,
  includingDestination: [
    IncludingDestination([
      baNaHills,
      artInParadise,
      suoiKhoangThanTai,
    ], 2),
  ],
  city: daNangCity,
  isGoodSeller: true,
);
//3. HCM
Pass hcmPass_1 = Pass(
  name: "Đi hết Hồ Chí Minh",
  image: "assets/images/dam_sen/dam_sen_1.jpg",
  overallRating: 4.7,
  price: 250000,
  originalPrice: 460000,
  includingDestination: [
    IncludingDestination([thaoCamVien, dinhDocLap], 2),
    IncludingDestination([
      baoTangMyThuat,
      baoTangYDuoc,
      damSen,
      suoiTien,
    ], 2),
  ],
  city: hcmCity,
  isGoodSeller: true,
);

Pass hcmPass_2 = Pass(
  name: "Sài Gòn - Thành phố phồn hoa",
  image: "assets/images/sg_phon_hoa.jpg",
  overallRating: 4.7,
  price: 300000,
  originalPrice: 500000,
  includingDestination: [
    IncludingDestination([
      thaoCamVien,
      dinhDocLap,
      damSen,
      baoTangMyThuat,
    ], 2),
  ],
  city: hcmCity,
  isGoodSeller: true,
);

Pass hcmPass_3 = Pass(
  name: "HCM-Bảo tàng văn hóa dân tộc",
  image: "assets/images/bao_tang_y_duoc/btyd_4.jpg",
  overallRating: 4.7,
  price: 700000,
  originalPrice: 1500000,
  includingDestination: [
    IncludingDestination([
      thaoCamVien,
      dinhDocLap,
      diadaoCuChi,
    ], 2),
    IncludingDestination([
      baoTangMyThuat,
      baoTangYDuoc,
      damSen,
      suoiTien,
    ], 2),
  ],
  city: hcmCity,
  isGoodSeller: true,
);

Pass hcmPass_4 = Pass(
  name: "HCM-Vui chơi thỏa thích",
  image: "assets/images/dam_sen/dam_sen_3.jpg",
  overallRating: 4.7,
  price: 250000,
  originalPrice: 460000,
  includingDestination: [
    IncludingDestination([damSen, suoiTien], 2),
    IncludingDestination([
      thaoCamVien,
      dinhDocLap,
    ], 1),
  ],
  city: hcmCity,
  isGoodSeller: true,
);

Pass hcmPass_5 = Pass(
  name: "HCM-Chơi ngay quà liền tay",
  image: "assets/images/suoi_tien/st_5.jpg",
  overallRating: 4.7,
  price: 250000,
  originalPrice: 460000,
  includingDestination: [
    IncludingDestination([thaoCamVien, dinhDocLap], 2),
  ],
  city: hcmCity,
  isGoodSeller: true,
);

List<Pass> mockupPasses = [
  //1. Ha Noi
  haNoiPass_1,
  haNoiPass_2,
  haNoiPass_3,
  haNoiPass_4,
  //2. Da Nang
  daNangPass_1,
  daNangPass_2,
  daNangPass_3,
  daNangPass_4,
  //3. Ho Chi Minh
  hcmPass_1,
  hcmPass_2,
  hcmPass_3,
  hcmPass_4,
  hcmPass_5,
];
