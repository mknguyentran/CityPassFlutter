import 'package:city_pass/screens/home/components/search_field.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Image.asset(
          "assets/images/home_bg3.jpg",
          height: getProportionateScreenWidth(280),
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: getProportionateScreenWidth(-25),
          child: SearchField(),
        )
      ],
    );
  }
}
