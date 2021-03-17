import 'package:city_pass/constants.dart';
import 'package:city_pass/model/pass.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/material.dart';
import 'package:city_pass/extensions.dart';

class PassCard extends StatelessWidget {
  const PassCard({
    Key key,
    @required this.pass,
    @required this.press,
  }) : super(key: key);

  final Pass pass;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        child: Stack(
          children: [
            AspectRatio(
              aspectRatio: 1.7,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(pass.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              bottom: getProportionateScreenWidth(0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 70,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
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
                      Row(
                        children: [
                          Icon(
                            Icons.star_rounded,
                            color: Colors.yellow,
                            size: getProportionateScreenWidth(12),
                          ),
                          Text(
                            pass.overallRating.toString(),
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      VerticalSpacing(
                        of: 10,
                      ),
                      Text(
                        pass.name,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ).addNeumorphism(offset: Offset(3, 3), blurRadius: 7),
    );
  }
}
