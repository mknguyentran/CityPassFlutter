import 'package:city_pass/constants.dart';
import 'package:city_pass/models/activity.dart';
import 'package:city_pass/models/pass.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/material.dart';

class PassRecommendationCard extends StatelessWidget {
  const PassRecommendationCard({
    Key key,
    @required this.pass,
  }) : super(key: key);

  final Pass pass;

  @override
  Widget build(BuildContext context) {
    var _cardWidth = 340.0;
    return Container(
      clipBehavior: Clip.hardEdge,
      width: _cardWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [kDefaultShadow],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(children: [
        Container(
          height: 180,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(pass.image),
            fit: BoxFit.cover,
          )),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${pass.city.name} • ${pass.destinationAmount} địa điểm",
                    style: TextStyle(color: subtitleTextColor),
                  ),
                  Wrap(
                    spacing: 10,
                    children: [
                      if(pass.isGoodSeller)
                      InfoTag(
                        "Bán chạy",
                        backgroundColor: lightGreenBackgroundColor,
                        foregroundColor: Colors.green[800],
                      ),
                      if(pass.isBestSaving)
                      InfoTag(
                        "Tiết kiệm",
                        backgroundColor: orangeBackgroundColor,
                        foregroundColor: primaryDarkColor,
                      ),
                    ],
                  )
                ],
              ),
              VerticalSpacing(of: 5),
              Text(
                pass.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              VerticalSpacing(of: 5),
              Row(
                children: [
                  Icon(
                    Icons.star_rounded,
                    size: 16,
                    color: starYellowColor,
                  ),
                  Text(
                    pass.overallRating.toString(),
                    style: TextStyle(fontSize: 14, color: starYellowColor),
                  )
                ],
              ),
              VerticalSpacing(of: 35),
              Text(
                vndCurrencyFormat.format(pass.originalPrice),
                style: TextStyle(
                  color: fadedTextColor,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              VerticalSpacing(of: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    vndCurrencyFormat.format(pass.price),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "-${pass.discountedPercentage}%",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: primaryLightColor),
                  )
                ],
              ),
            ],
          ),
        )
      ]),
    );
  }
}

class InfoTag extends StatelessWidget {
  const InfoTag(
    String this.text, {
    Key key,
    @required this.backgroundColor,
    @required this.foregroundColor,
  }) : super(key: key);

  final Color backgroundColor, foregroundColor;
  final text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(5)),
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
      child: Text(
        text,
        style: TextStyle(color: foregroundColor, fontSize: 13),
      ),
    );
  }
}
