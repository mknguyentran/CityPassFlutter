import 'package:city_pass/constants.dart';
import 'package:city_pass/model/pass.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/material.dart';

class PassDetailHeader extends StatelessWidget {
  final Pass pass;
  const PassDetailHeader({
    Key key,
    @required this.pass,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
            height: percentageOfScreenHeight(30),
            child: SizedBox.expand(
                child: Image.asset(pass.image, fit: BoxFit.cover))),
        Positioned(
            bottom: 0,
            child: Container(
              padding:
                  EdgeInsets.fromLTRB(kDefaultPadding, 20, kDefaultPadding, 20),
              width: MediaQuery.of(context).size.width,
              color: Colors.black.withOpacity(0.6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 5,
                    child: Text(
                      pass.name,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.star_rounded,
                          color: Colors.amber,
                        ),
                        Text(
                          pass.overallRating.toString(),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ))
      ],
    );
  }
}
