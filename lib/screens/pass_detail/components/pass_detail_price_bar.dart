import 'package:city_pass/constants.dart';
import 'package:city_pass/models/pass.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/material.dart';

class PassDetailPriceBar extends StatelessWidget {
  const PassDetailPriceBar({
    Key key,
    @required this.pass,
  }) : super(key: key);

  final Pass pass;

  @override
  Widget build(BuildContext context) {
    const _priceTitleTextStyle =
        TextStyle(fontSize: 13, color: subtitleTextColor);
    return Padding(
      padding:
          const EdgeInsets.fromLTRB(kDefaultPadding, 0, kDefaultPadding, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (pass.childrenPrice != null)
                  Text("NGƯỜI LỚN", style: _priceTitleTextStyle),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Text(
                        vndCurrencyFormat.format(pass.price),
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: primaryDarkColor,
                        ),
                      ),
                    ),
                    Text(
                      vndCurrencyFormat.format(pass.originalPrice),
                      style: TextStyle(
                        fontSize: 18,
                        color: fadedTextColor,
                        decoration: TextDecoration.lineThrough,
                      ),
                    )
                  ],
                ),
                if (pass.childrenPrice != null)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VerticalSpacing(of: 15),
                      Text("TRẺ EM", style: _priceTitleTextStyle),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Text(
                              vndCurrencyFormat
                                  .format(pass.childrenPrice.price),
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: primaryDarkColor,
                              ),
                            ),
                          ),
                          Text(
                            vndCurrencyFormat
                                .format(pass.childrenPrice.originalPrice),
                            style: TextStyle(
                              fontSize: 18,
                              color: fadedTextColor,
                              decoration: TextDecoration.lineThrough,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: primaryDarkColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 15, 5, 5),
              child: Column(
                children: [
                  Text(
                    "TIẾT KIỆM",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "${pass.discountedPercentage}%",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}