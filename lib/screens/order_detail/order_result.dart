import 'package:city_pass/constants.dart';
import 'package:city_pass/model/order_detail.dart';
import 'package:city_pass/screens/pass_detail/components/choose_pass_amount.dart';
import 'package:city_pass/screens/user_passes/user_passes.dart';
import 'package:city_pass/shared/section_title.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderResult extends StatefulWidget {
  final OrderDetail orderDetail;

  const OrderResult({Key key, @required this.orderDetail}) : super(key: key);

  @override
  _OrderResultState createState() => _OrderResultState();
}

class _OrderResultState extends State<OrderResult> {
  @override
  Widget build(BuildContext context) {
    const divider = Divider(
      color: dividerColor,
      thickness: 10,
      height: 35,
    );
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SuccessfulOrderResult(),
            divider,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                children: [
                  SectionTitle(
                    title: "Tóm tắt đơn hàng",
                    lineSpacing: 5,
                  ),
                  _buildOrderDetailItems(widget.orderDetail),
                ],
              ),
            ),
            divider,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                children: [
                  PaymentInfo(
                    lineSpacing: 4,
                    title: "Phương thức thanh toán",
                    rightWidget: PaymentMethodRow(
                      widget.orderDetail.paymentMethod,
                      fontSize: 15,
                    ),
                  ),
                  PaymentInfo(
                    title: "Tổng tạm tính",
                    content: vndCurrencyFormat.format(widget.orderDetail.total),
                  ),
                  if (widget.orderDetail.discountCode != null)
                    PaymentInfo(
                      title:
                          "Mã ưu đãi (${widget.orderDetail.discountCode.codeName.toUpperCase()})",
                      content:
                          "-${vndCurrencyFormat.format(widget.orderDetail.discountedAmount)}",
                    ),
                  Divider(
                    height: 40,
                    color: subtitleTextColor,
                  ),
                  OrderTotalInfo(total: widget.orderDetail.finalTotal),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
              kDefaultPadding, 10, kDefaultPadding, 10),
          child: Container(
            height: 50,
            width: double.infinity,
            child: _buildGoToUserPassButton(context),
          ),
        ),
      ),
    );
  }

  Column _buildOrderDetailItems(OrderDetail orderDetail) {
    return Column(
      children: <Widget>[
        OrderDetailItem(
          passName: orderDetail.passDetail.name,
          amount: orderDetail.amount,
          price: orderDetail.passDetail.price,
          hasAdultLabel: orderDetail.childrenAmount > 0,
        ),
        if (orderDetail.childrenAmount > 0)
          OrderDetailItem(
            passName: orderDetail.passDetail.name,
            amount: orderDetail.childrenAmount,
            price: orderDetail.passDetail.childrenPrice,
            hasChildrenLabel: true,
          ),
      ],
    );
  }
}

class OrderTotalInfo extends StatelessWidget {
  const OrderTotalInfo({
    Key key,
    this.lineSpacing = 7.0,
    @required this.total,
  }) : super(key: key);

  final double lineSpacing, total;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: lineSpacing),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Tổng cộng",
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            vndCurrencyFormat.format(total),
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}

class PaymentInfo extends StatelessWidget {
  const PaymentInfo({
    Key key,
    this.lineSpacing = 6.0,
    this.title,
    this.content,
    this.rightWidget,
  }) : super(key: key);

  final double lineSpacing;
  final String title, content;
  final Widget rightWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: lineSpacing),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
          content != null
              ? Text(
                  content,
                  style: TextStyle(color: Colors.black, fontSize: 15),
                )
              : rightWidget
        ],
      ),
    );
  }
}

class OrderDetailItem extends StatelessWidget {
  const OrderDetailItem({
    Key key,
    this.lineSpacing = 7.0,
    this.hasAdultLabel = false,
    this.hasChildrenLabel = false,
    @required this.price,
    @required this.amount,
    @required this.passName,
  }) : super(key: key);

  final bool hasAdultLabel, hasChildrenLabel;
  final double lineSpacing, price;
  final int amount;
  final String passName;

  @override
  Widget build(BuildContext context) {
    var productName = passName;
    if (hasAdultLabel) {
      productName = "Người lớn - " + productName;
    } else if (hasChildrenLabel) {
      productName = "Trẻ em - " + productName;
    }
    return Padding(
      padding: EdgeInsets.symmetric(vertical: lineSpacing),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: percentageOfScreenWidth(3)),
                  child: Text(
                    "${amount}x",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    productName,
                    style: TextStyle(color: Colors.black, fontSize: 15),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Text(
              vndCurrencyFormat.format(price * amount),
              style: TextStyle(color: Colors.black, fontSize: 15),
              textAlign: TextAlign.right,
            ),
          )
        ],
      ),
    );
  }
}

ElevatedButton _buildGoToUserPassButton(BuildContext context) {
  return ElevatedButton(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(primaryLightColor),
      textStyle: MaterialStateProperty.all(
        TextStyle(
          fontFamily: "SFProRounded",
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
    onPressed: () {
      Navigator.of(context).popUntil((route) => route.isFirst);
      Navigator.push(
        context,
        CupertinoPageRoute(builder: (context) {
          return UserPasses();
        }),
      );
    },
    child: Text(
      'Xem CityPass của tôi',
      style: TextStyle(fontSize: 20),
    ),
  );
}

AppBar _buildAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    brightness: Brightness.light,
    leading: IconButton(
      color: primaryDarkColor,
      icon: Icon(
        Icons.chevron_left_rounded,
        size: 30,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    ),
  );
}

class SuccessfulOrderResult extends StatelessWidget {
  const SuccessfulOrderResult({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: percentageOfScreenHeight(25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            CupertinoIcons.checkmark_seal_fill,
            size: 90,
            color: primaryLightColor,
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Text(
              "Thanh toán thành công",
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
