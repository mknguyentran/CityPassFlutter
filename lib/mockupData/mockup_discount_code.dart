import 'package:city_pass/models/discount_code.dart';

DiscountCode thangBa = PercentageDiscountCode(
  "UUDAITHANG3",
  "Giảm 25% cho Combo mua trong tháng 3",
  DateTime(2021, 03, 31),
  discountPercentage: 25,
);
DiscountCode byeCovid = AmountDiscountCode(
  "byeCovid",
  "Tạm biệt COVID-19. Uư đãi 19k!!!",
  DateTime(2021, 04, 15),
  discountAmount: 19000,
);
DiscountCode flashsale30k = AmountDiscountCode(
  "flashsale30k",
  "Flash Sale - Giảm ngay 30k",
  DateTime(2021, 03, 28),
  discountAmount: 30000,
);
DiscountCode chaoMungBanMoi = PercentageDiscountCode(
  "chaoMungBanMoi",
  "CityPass tặng thành viên mới ưu đãi 10%",
  DateTime(2021, 08, 16),
  discountPercentage: 10,
);
DiscountCode donHangDauTien = AmountDiscountCode(
  "donHangDauTien",
  "Giảm ngay 50k cho đơn hàng đầu tiên",
  DateTime(2021, 12, 31),
  discountAmount: 50000,
);

List<DiscountCode> availableDiscountCode = [
  thangBa,
  byeCovid,
  flashsale30k,
  donHangDauTien,
  chaoMungBanMoi,
  chaoMungBanMoi,
  chaoMungBanMoi,
];
