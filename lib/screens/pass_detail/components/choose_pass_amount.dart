import 'package:city_pass/constants.dart';
import 'package:city_pass/mockupData/mockup_payment_method.dart';
import 'package:city_pass/model/discount_code.dart';
import 'package:city_pass/model/order_detail.dart';
import 'package:city_pass/model/pass.dart';
import 'package:city_pass/model/payment_method.dart';
import 'package:city_pass/models/passDetailInformation.dart';
import 'package:city_pass/screens/order_detail/order_result.dart';
import 'package:city_pass/screens/pass_detail/components/discount_code_picker.dart';
import 'package:city_pass/screens/pass_detail/components/payment_method_picker.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChoosePassAmount extends StatefulWidget {
  final PassDetailInformation passDetail;

  const ChoosePassAmount({
    Key key,
    @required this.passDetail,
  }) : super(key: key);

  @override
  _ChoosePassAmountState createState() => _ChoosePassAmountState();
}

class _ChoosePassAmountState extends State<ChoosePassAmount> {
  int amount = 1, childrenAmount = 0;
  double total = 0;
  PaymentMethod _currentPaymentMethod = visa;
  DiscountCode _currentDiscountCode;

  void increaseAmount({bool increaseChild = false}) {
    if (increaseChild) {
      setState(() {
        childrenAmount++;
      });
    } else {
      setState(() {
        amount++;
      });
    }
  }

  void decreaseAmount({bool decreaseChild = false}) {
    if (decreaseChild) {
      if (childrenAmount > 0) {
        setState(() {
          childrenAmount--;
        });
      }
    } else {
      if (amount > 1) {
        setState(() {
          amount--;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    total = widget.passDetail.price * amount;
    if (widget.passDetail.price != null) {
      total += widget.passDetail.price * childrenAmount;
    }
    return Scaffold(
      body: Container(
        height: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [kDefaultShadow],
                color: Colors.white,
              ),
              height: 50,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  widget.passDetail.name,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  kDefaultPadding, 0, kDefaultPadding, 50),
              child: _buildAmountPicker(),
            ),
            Container(
              height: 150,
              width: double.infinity,
              padding:
                  EdgeInsets.fromLTRB(kDefaultPadding, 10, kDefaultPadding, 10),
              decoration: BoxDecoration(
                boxShadow: [kDefaultShadow],
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            _navigateToPaymentMethodPicker(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(color: fadedTextColor),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Phương thức thanh toán",
                                  style: TextStyle(color: subtitleTextColor),
                                ),
                                VerticalSpacing(
                                  of: 8,
                                ),
                                PaymentMethodRow(
                                  _currentPaymentMethod,
                                  withChangeButton: true,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            _navigateToDiscountCodePicker(context);
                          },
                          child: Container(
                            color: Colors.transparent,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: DiscountCodeInfo(
                              discountCode: _currentDiscountCode,
                              onRemove: () {
                                setState(() {
                                  _currentDiscountCode = null;
                                });
                              },
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _currentDiscountCode == null
                                    ? "Tổng cộng"
                                    : vndCurrencyFormat.format(
                                        total.discountedAmount(
                                            _currentDiscountCode)),
                                style: TextStyle(
                                    color: subtitleTextColor,
                                    decoration: _currentDiscountCode == null
                                        ? null
                                        : TextDecoration.lineThrough),
                              ),
                              VerticalSpacing(
                                of: 5,
                              ),
                              Text(
                                _currentDiscountCode == null
                                    ? vndCurrencyFormat.format(total)
                                    : vndCurrencyFormat.format(
                                        total.withDiscountCode(
                                            _currentDiscountCode)),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            height: 50,
                            child: _buildBuyButton(
                              context,
                              passDetailInformation: widget.passDetail,
                              amount: amount,
                              childrenAmount: childrenAmount,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToPaymentMethodPicker(BuildContext context) async {
    final pickedMethod = await Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) {
        return PaymentMethodPicker(
          currentPaymentMethod: _currentPaymentMethod,
        );
      }),
    );

    if (pickedMethod is PaymentMethod) {
      setState(() {
        _currentPaymentMethod = pickedMethod;
      });
    }
  }

  void _navigateToDiscountCodePicker(BuildContext context) async {
    final pickedCode = await Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) {
        return DiscountCodePicker();
      }),
    );

    if (pickedCode is DiscountCode) {
      setState(() {
        _currentDiscountCode = pickedCode;
      });
    }
  }

  Widget _buildAmountPicker() {
    if (widget.passDetail.price != null) {
      return Column(
        children: [
          AmountPicker(
            label: "Người lớn",
            amount: amount,
            minAmount: 1,
            increaseFunction: increaseAmount,
            decreaseFunction: decreaseAmount,
          ),
          VerticalSpacing(),
          AmountPicker(
            label: "Trẻ em",
            amount: childrenAmount,
            increaseFunction: () {
              increaseAmount(increaseChild: true);
            },
            decreaseFunction: () {
              decreaseAmount(decreaseChild: true);
            },
          ),
        ],
      );
    } else {
      return AmountPicker(
        label: "Số lượng",
        amount: amount,
        minAmount: 1,
        increaseFunction: increaseAmount,
        decreaseFunction: decreaseAmount,
      );
    }
  }

  ElevatedButton _buildBuyButton(
    BuildContext context, {
    @required PassDetailInformation passDetailInformation,
    int amount,
    int childrenAmount,
  }) {
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
                borderRadius: BorderRadius.circular(7),
              ),
            )),
        child: Text("Thanh toán"),
        onPressed: () {
          Navigator.of(context).pop();
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (context) {
              OrderDetail orderDetail = new OrderDetail(widget.passDetail, amount,
                  childrenAmount, _currentPaymentMethod, _currentDiscountCode);
              return OrderResult(
                orderDetail: orderDetail,
              );
            }),
          );
        });
  }
}

class DiscountCodeInfo extends StatelessWidget {
  const DiscountCodeInfo({
    Key key,
    this.discountCode,
    this.onRemove,
    this.onPick,
  }) : super(key: key);

  final DiscountCode discountCode;
  final GestureTapCallback onRemove, onPick;

  @override
  Widget build(BuildContext context) {
    if (discountCode == null) {
      return GestureDetector(
        onTap: onPick,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Thêm ưu đãi".toUpperCase(),
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: primaryDarkColor, fontWeight: FontWeight.bold),
            )
          ],
        ),
      );
    } else {
      return GestureDetector(
        onTap: onPick,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: Text(
                discountCode.codeName.toUpperCase(),
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: primaryDarkColor, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                  onTap: onRemove,
                  child: Icon(
                    Icons.cancel,
                    color: fadedTextColor,
                  )),
            )
          ],
        ),
      );
    }
  }
}

class PaymentMethodRow extends StatelessWidget {
  const PaymentMethodRow(
    this.paymentMethod, {
    Key key,
    this.withChangeButton = false,
    this.isChosen = false,
    this.padding = EdgeInsets.zero,
    this.fontSize = 16,
  }) : super(key: key);

  final PaymentMethod paymentMethod;
  final bool withChangeButton, isChosen;
  final EdgeInsetsGeometry padding;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                decoration: BoxDecoration(
                    border: Border.all(color: kIconColor, width: 1.2),
                    borderRadius: BorderRadius.circular(5)),
                child: Image.asset(
                  paymentMethod.logoPath,
                  height: 20,
                  fit: BoxFit.contain,
                ),
              ),
              VerticalDivider(
                width: 10,
              ),
              Text(
                paymentMethod.name,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: fontSize,
                  fontWeight: isChosen ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              if (withChangeButton)
                VerticalDivider(
                  width: 10,
                ),
              if (withChangeButton)
                Icon(
                  CupertinoIcons.chevron_up,
                  size: 15,
                )
            ],
          ),
          if (isChosen)
            Icon(
              CupertinoIcons.check_mark,
              color: Colors.green,
              size: 18,
            )
        ],
      ),
    );
  }
}

class AmountPicker extends StatelessWidget {
  const AmountPicker({
    Key key,
    @required this.label,
    @required this.amount,
    this.minAmount = 0,
    @required this.increaseFunction,
    @required this.decreaseFunction,
  }) : super(key: key);

  final int amount, minAmount;
  final Function() decreaseFunction, increaseFunction;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "$label:",
          style: TextStyle(fontSize: 24),
        ),
        Row(
          children: [
            IconButton(
              padding: EdgeInsets.all(0),
              iconSize: 40,
              color: primaryDarkColor,
              disabledColor: lightGray,
              icon: Icon(Icons.remove_circle_outline_rounded),
              onPressed: amount > minAmount ? decreaseFunction : null,
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              width: getProportionateScreenWidth(40),
              height: getProportionateScreenWidth(40),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(width: 0.5, color: lightGray),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Text(
                amount.toString(),
                style: TextStyle(fontSize: 24),
              ),
            ),
            IconButton(
              iconSize: 40,
              padding: EdgeInsets.all(0),
              color: primaryDarkColor,
              disabledColor: lightGray,
              icon: Icon(Icons.add_circle_outline_rounded),
              onPressed: increaseFunction,
            ),
          ],
        )
      ],
    );
  }
}
