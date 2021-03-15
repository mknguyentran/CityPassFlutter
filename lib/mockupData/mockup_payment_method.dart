import 'package:city_pass/models/payment_method.dart';

PaymentMethod momo = PaymentMethod("Ví MoMo", "assets/images/momo.png");
PaymentMethod tpbank = PaymentMethod("ATM 8998", "assets/images/tpbank.png");
PaymentMethod visa = PaymentMethod("9327", "assets/images/visa.png");
PaymentMethod zalo = PaymentMethod("Ví ZaloPay", "assets/images/zalopay.png");

List<PaymentMethod> availablePaymentMethod = [
  visa,
  tpbank,
  momo,
  zalo,
];
