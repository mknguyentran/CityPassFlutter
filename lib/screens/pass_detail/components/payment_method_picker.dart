import 'package:city_pass/constants.dart';
import 'package:city_pass/mockupData/mockup_payment_method.dart';
import 'package:city_pass/models/payment_method.dart';
import 'package:city_pass/screens/pass_detail/components/choose_pass_amount.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentMethodPicker extends StatelessWidget {
  final PaymentMethod currentPaymentMethod;

  const PaymentMethodPicker({Key key, this.currentPaymentMethod})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var lineHeight = 15.0;
    return Scaffold(
      appBar: _buildAppBar(context),
      backgroundColor: lightGrayBackground,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: availablePaymentMethod.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop(availablePaymentMethod[index]);
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: PaymentMethodRow(
                      availablePaymentMethod[index],
                      padding: EdgeInsets.symmetric(
                          horizontal: kDefaultPadding, vertical: lineHeight),
                      isChosen: currentPaymentMethod != null &&
                          currentPaymentMethod == availablePaymentMethod[index],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(
                color: subtitleTextColor,
                height: 0,
                thickness: 0.5,
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        "Chọn phương thức thanh toán",
        style: TextStyle(color: textBlack),
      ),
      leading: IconButton(
        icon: Icon(CupertinoIcons.xmark, size: 20, color: subtitleTextColor),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
