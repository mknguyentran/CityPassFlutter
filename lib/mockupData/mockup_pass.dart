import 'package:city_pass/mockupData/mockup_activity.dart';
import 'package:city_pass/models/city.dart';
import 'package:city_pass/models/pass.dart';

Pass daNangPass = Pass(
  name: "Kì nghỉ ở Đà Nẵng",
  image: "assets/images/banahill.jpg",
  overallRating: 4.9,
  price: 780000,
  originalPrice: 1200000,
  includingDestination: [
    IncludingDestination([baNaHills, artInParadise], 2),
  ],
  city: City("Đà Nẵng"),
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
    IncludingDestination([baoTangMyThuat, baoTangMyThuat], 1),
    IncludingDestination([thaoCamVien, thaoCamVien, thaoCamVien], 2),
  ],
  city: City("TP. Hồ Chí Minh"),
  isGoodSeller: true,
);



List<Pass> mockupPasses = [
  daNangPass,
  hcmPass1,
];
