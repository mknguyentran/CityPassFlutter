import 'package:city_pass/models/pass.dart';
import 'package:city_pass/models/payment_method.dart';

class OrderDetail {
  final Pass pass;
  final int amount, childrenAmount;
  final PaymentMethod paymentMethod;

  OrderDetail(
    this.pass,
    this.amount,
    this.childrenAmount,
    this.paymentMethod,
  );

  double get total {
    if (pass.childrenPrice != null) {
      return (pass.price * amount) +
          (pass.childrenPrice.price * childrenAmount);
    } else {
      return (pass.price * amount);
    }
  }
}
