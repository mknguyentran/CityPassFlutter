import 'package:city_pass/mockupData/mockup_activity.dart';
import 'package:city_pass/mockupData/mockup_city.dart';
import 'package:city_pass/models/pass.dart';

Pass daNangPass = Pass(
  name: "Kì nghỉ ở Đà Nẵng",
  image: "assets/images/banahill.jpg",
  overallRating: 4.9,
  price: 780000,
  originalPrice: 1200000,
  childrenPrice: PassChildrenPrice(price: 740000, originalPrice: 1150000),
  includingDestination: [
    IncludingDestination([baNaHills, artInParadise], 2),
  ],
  city: daNangCity,
  isGoodSeller: true,
);

Pass hcmPass1 = Pass(
  name: "Đi hết Hồ Chí Minh",
  image: "assets/images/thao_cam_vien.jpg",
  overallRating: 4.7,
  price: 250000,
  originalPrice: 460000,
  includingDestination: [
    IncludingDestination([thaoCamVien, dinhDocLap], 2),
    IncludingDestination([
      thaoCamVien,
      thaoCamVien,
      thaoCamVien,
      baoTangMyThuat,
      baoTangMyThuat,
    ], 2),
  ],
  city: hcmCity,
  isGoodSeller: true,
);

List<Pass> mockupPasses = [
  daNangPass,
  hcmPass1,
];
