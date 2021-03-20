import 'package:city_pass/constants.dart';
import 'package:city_pass/model/pass.dart';
import 'package:city_pass/models/passDetailInformation.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/material.dart';

class PassDetailPriceBar extends StatelessWidget {
  const PassDetailPriceBar({
    Key key,
    @required this.passDetail,
  }) : super(key: key);

  final PassDetailInformation passDetail;

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
                if (passDetail.price != null)
                  Text("NGƯỜI LỚN", style: _priceTitleTextStyle),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Text(
                        vndCurrencyFormat.format(passDetail.price),
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: primaryDarkColor,
                        ),
                      ),
                    ),
                    Text(
                      vndCurrencyFormat.format(passDetail.price),
                      style: TextStyle(
                        fontSize: 18,
                        color: fadedTextColor,
                        decoration: TextDecoration.lineThrough,
                      ),
                    )
                  ],
                ),
                if (passDetail.price != null)
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
                                  .format(passDetail.price),
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: primaryDarkColor,
                              ),
                            ),
                          ),
                          Text(
                            vndCurrencyFormat
                                .format(passDetail.price),
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
                    "35%",
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