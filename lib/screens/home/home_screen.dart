import 'package:city_pass/screens/home/components/history.dart';
import 'package:city_pass/screens/home/components/location.dart';
import 'package:city_pass/screens/home/components/passes.dart';
import 'package:city_pass/screens/user_passes/user_passes.dart';
import 'package:city_pass/shared/custom_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:city_pass/screens/home/components/featured.dart';
import 'package:city_pass/constants.dart';
import 'package:city_pass/size_config.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static List<Widget> tabs = [
    Featured(),
    Locations(),
    UserPasses(),
    Passes(),
    History()
  ];
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: buildAppBar(),
      body: tabs.elementAt(_currentIndex),
      bottomNavigationBar: CustomNavBar(
        currentIndex: _currentIndex,
        children: [
          CustomNavItem(icon: Icons.star, label: "Đề xuất"),
          CustomNavItem(icon: Icons.location_on, label: "Địa điểm"),
          CustomNavItem(icon: Icons.qr_code),
          CustomNavItem(icon: Icons.local_activity_rounded, label: "CityPass"),
          CustomNavItem(icon: Icons.history, label: "Lịch sử"),
        ],
        focusedIndex: 2,
        onChange: _onItemTapped,
        focusedAction: () {
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (context) {
              return UserPasses();
            }),
          );
        },
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      brightness: Brightness.dark,
      centerTitle: false,
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
