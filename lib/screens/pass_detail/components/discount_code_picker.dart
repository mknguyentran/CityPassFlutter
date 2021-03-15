import 'package:city_pass/constants.dart';
import 'package:city_pass/mockupData/mockup_discount_code.dart';
import 'package:city_pass/models/discount_code.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';

class DiscountCodePicker extends StatelessWidget {
  void _onPickDiscountCode(BuildContext context, DiscountCode discountCode) {
    Navigator.of(context).pop(discountCode);
  }

  @override
  Widget build(BuildContext context) {
    var smallBorderRadius = 5.0;
    var largeBorderRadius = 15.0;

    return Scaffold(
      backgroundColor: darkGrayBackground,
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
            vertical: 30,
          ),
          child: Column(
            children: [
              ...List.generate(
                availableDiscountCode.length,
                (index) => DiscountCodeTicket(
                  availableDiscountCode[index],
                  smallBorderRadius: smallBorderRadius,
                  largeBorderRadius: largeBorderRadius,
                  onPick: () {
                    _onPickDiscountCode(context, availableDiscountCode[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        "Mã giảm giá",
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

class DiscountCodeTicket extends StatelessWidget {
  const DiscountCodeTicket(
    this.discountCode, {
    Key key,
    @required this.smallBorderRadius,
    @required this.largeBorderRadius,
    @required this.onPick,
    this.lineHeight = 10
  }) : super(key: key);

  final double smallBorderRadius;
  final double largeBorderRadius;
  final double lineHeight;
  final DiscountCode discountCode;
  final GestureTapCallback onPick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: lineHeight),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(smallBorderRadius),
                  right: Radius.circular(largeBorderRadius),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 10,
                    decoration: BoxDecoration(
                      color: primaryLightColor,
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(smallBorderRadius),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            discountCode.name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Divider(
                            height: 10,
                            color: Colors.transparent,
                          ),
                          Text(
                            "HSD: ${simpleDateFormat.format(discountCode.expiredAt)}",
                            style: TextStyle(color: subtitleTextColor),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          DottedLine(
            direction: Axis.vertical,
            lineLength: 60,
            dashColor: fadedTextColor,
            dashLength: 6,
            dashGapLength: 6,
          ),
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: onPick,
              child: Container(
                alignment: Alignment.center,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(largeBorderRadius),
                    right: Radius.circular(smallBorderRadius),
                  ),
                ),
                child: Text(
                  "Chọn",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: primaryLightColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
