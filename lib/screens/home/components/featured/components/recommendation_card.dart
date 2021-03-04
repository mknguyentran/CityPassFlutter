import 'package:city_pass/constants.dart';
import 'package:city_pass/models/activity.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/material.dart';

class RecommendationCard extends StatelessWidget {
  const RecommendationCard({
    Key key,
    @required this.activity,
  }) : super(key: key);

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 330,
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 1.5,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(activity.image),
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
                    activity.name,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  VerticalSpacing(
                    of: 10,
                  ),
                  Text(
                    activity.briefDescription,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
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
