import 'package:CityPass/shared/custom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:CityPass/screens/home/components/body.dart';
import 'package:CityPass/constants.dart';
import 'package:CityPass/size_config.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: buildAppBar(),
      body: Body(),
      bottomNavigationBar: CustomNavBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      brightness: Brightness.dark,
      title: Row(
        children: [
          Text(
            'CityPass tại TP. Hồ Chí Minh',
          ),
          IconButton(
            icon: Icon(
              Icons.arrow_drop_down,
              color: kWhiteIconColor,
            ),
            onPressed: () {},
          )
        ],
      ),
      actions: [
        IconButton(
            icon: ClipOval(child: Image.asset("assets/images/profile.png")),
            onPressed: () {})
      ],
    );
  }
}
