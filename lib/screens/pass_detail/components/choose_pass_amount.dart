import 'package:city_pass/constants.dart';
import 'package:city_pass/models/pass.dart';
import 'package:city_pass/screens/order_detail/order_result.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChoosePassAmount extends StatefulWidget {
  final Pass pass;

  const ChoosePassAmount({
    Key key,
    @required this.pass,
  }) : super(key: key);

  @override
  _ChoosePassAmountState createState() => _ChoosePassAmountState();
}

class _ChoosePassAmountState extends State<ChoosePassAmount> {
  int amount = 1, childrenAmount = 0;
  double total = 0;

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
    total = widget.pass.price * amount;
    if (widget.pass.childrenPrice != null) {
      total += widget.pass.childrenPrice.price * childrenAmount;
    }
    return Container(
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
                widget.pass.name,
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
            height: 130,
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
                    Column(
                      children: [
                        Text(
                          "Phương thức thanh toán",
                          style: TextStyle(color: subtitleTextColor),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Tổng cộng",
                          style: TextStyle(color: subtitleTextColor),
                        ),
                        VerticalSpacing(
                          of: 6,
                        ),
                        Text(
                          vndCurrencyFormat.format(total),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  child: _buildBuyButton(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAmountPicker() {
    if (widget.pass.childrenPrice != null) {
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

  ElevatedButton _buildBuyButton(BuildContext context) {
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
            )),
        child: Text("Thanh toán"),
        onPressed: () {
          Navigator.of(context).pop();
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (context) {
              return OrderResult();
            }),
          );
        });
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
