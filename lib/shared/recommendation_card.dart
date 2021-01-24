import 'package:CityPass/constants.dart';
import 'package:CityPass/models/Attraction.dart';
import 'package:CityPass/size_config.dart';
import 'package:flutter/material.dart';

class RecommendationCard extends StatelessWidget {
  const RecommendationCard({
    Key key,
    @required this.attraction,
    @required this.press,
  }) : super(key: key);

  final Attraction attraction;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(350),
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 1.5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(attraction.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: getProportionateScreenWidth(0),
            child: Container(
              alignment: Alignment.centerLeft,
              width: getProportionateScreenWidth(350),
              padding: EdgeInsets.all(
                getProportionateScreenWidth(kDefaultPadding),
              ),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                boxShadow: [kDefaultShadow],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    attraction.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                  VerticalSpacing(
                    of: 10,
                  ),
                  Text(
                    attraction.briefDescription,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Colors.white
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

