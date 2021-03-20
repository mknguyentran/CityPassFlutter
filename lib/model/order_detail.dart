import 'package:city_pass/model/discount_code.dart';
import 'package:city_pass/model/pass.dart';
import 'package:city_pass/model/payment_method.dart';
import 'package:city_pass/models/passDetailInformation.dart';

class OrderDetail {
  final PassDetailInformation passDetail;
  final int amount, childrenAmount;
  final PaymentMethod paymentMethod;
  final DiscountCode discountCode;

  OrderDetail(this.passDetail, this.amount, this.childrenAmount, this.paymentMethod,
      this.discountCode);

  double get total {
    if (passDetail.price != null) {
      return (passDetail.price * amount) +
          (passDetail.price * childrenAmount);
    } else {
      return (passDetail.price * amount);
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
