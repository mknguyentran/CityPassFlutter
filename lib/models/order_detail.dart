import 'package:city_pass/models/discount_code.dart';
import 'package:city_pass/models/pass.dart';
import 'package:city_pass/models/payment_method.dart';

class OrderDetail {
  final Pass pass;
  final int amount, childrenAmount;
  final PaymentMethod paymentMethod;
  final DiscountCode discountCode;

  OrderDetail(this.pass, this.amount, this.childrenAmount, this.paymentMethod,
      this.discountCode);

  double get total {
    if (pass.childrenPrice != null) {
      return (pass.price * amount) +
          (pass.childrenPrice.price * childrenAmount);
    } else {
      return (pass.price * amount);
    }
  }

  double get discountedAmount {
    return total.discountedAmount(discountCode);
  }

  double get finalTotal {
    if (discountCode != null) {
      return total.withDiscountCode(discountCode);
    } else {
      return total;
    }
  }
}
