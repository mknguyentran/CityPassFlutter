import 'package:flutter/material.dart';

class Pass {
  final String name, image, briefDescription;

  Pass({
    @required this.briefDescription,
    @required this.name,
    @required this.image,
  });
}

List<Pass> mockupPasses = [
  Pass(
    name: "Đi hết Hồ Chí Minh",
    image: "assets/images/thao_cam_vien.jpg",
    briefDescription: "Tìm hiểu hơn 1000 cá thể động, thực vật khác nhau",
  ),
  Pass(
    name: "Thổ địa Sài Gòn",
    image: "assets/images/dinh_doc_lap.jpg",
    briefDescription: "Biểu tượng chiến thắng và hòa bình của thành phố",
  ),
];
