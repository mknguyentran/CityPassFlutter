import 'dart:math';

import 'package:city_pass/models/city.dart';
import 'package:city_pass/screens/home/components/account/account.dart';
import 'package:city_pass/screens/home/components/city_picker/city_picker.dart';
import 'package:city_pass/shared/search_field.dart';
import 'package:city_pass/screens/home/components/location/location.dart';
import 'package:city_pass/screens/home/components/passes/passes.dart';
import 'package:city_pass/screens/user_passes/user_passes.dart';
import 'package:city_pass/shared/custom_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:city_pass/screens/home/components/featured/explore.dart';
import 'package:city_pass/constants.dart';
import 'package:city_pass/size_config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key, this.currentCity}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();

  final City currentCity;
}

class _HomeScreenState extends State<HomeScreen> {
  static List<Widget> tabs;
  int _currentIndex = 0;
  City _currentCity;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _changeCity(City city) {
    setState(() {
      _currentCity = city;
    });
  }

  void _removeCity() {
    setState(() {
      _currentCity = null;
    });
  }

  @override
  void initState() {
    super.initState();
    tabs = [
      Explore(city: _currentCity),
      Locations(city: _currentCity),
      UserPasses(),
      Passes(city: _currentCity),
      Account()
    ];
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(_currentIndex),
      extendBodyBehindAppBar: _currentIndex == 0 || _currentIndex == 4,
      body: tabs.elementAt(_currentIndex),
      bottomNavigationBar: CustomNavBar(
        currentIndex: _currentIndex,
        children: [
          CustomNavItem(
              icon: CupertinoIcons.compass,
              selectedIcon: CupertinoIcons.compass_fill,
              label: _currentCity != null ? _currentCity.name : "Khám phá"),
          CustomNavItem(
              icon: Icons.location_on_outlined,
              selectedIcon: Icons.location_on,
              label: "Địa điểm"),
          CustomNavItem(icon: CupertinoIcons.qrcode),
          CustomNavItem(
              icon: Icons.local_activity_outlined,
              selectedIcon: Icons.local_activity_rounded,
              label: "CityPass"),
          CustomNavItem(
            icon: CupertinoIcons.person_circle,
            selectedIcon: CupertinoIcons.person_circle_fill,
            label: "Tài khoản",
          ),
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

  AppBar buildAppBar(int tab, [String hintText]) {
    var _backgroundColor = Colors.white;
    var _brightness = Brightness.light;
    var _foregroundColor = textBlack;
    var _bottom = PreferredSize(
      preferredSize: Size.fromHeight(80),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding).add(
          const EdgeInsets.only(bottom: 20),
        ),
        child: SearchField(
          height: 45,
          width: double.infinity,
          hintText: "Tìm kiếm điểm đến, hoạt đông,...",
          boxShadow: [kDefaultShadow],
        ),
      ),
    );
    if (tab == 0) {
      _backgroundColor = Colors.black.withOpacity(0.5);
      _brightness = Brightness.dark;
      _foregroundColor = Colors.white;
      _bottom = null;
    } else if (tab == 4) {
      return AppBar(
        brightness: _brightness,
        backgroundColor: Colors.transparent,
        elevation: 0,
      );
    }
    return AppBar(
      backgroundColor: _backgroundColor,
      brightness: _brightness,
      elevation: 0,
      centerTitle: false,
      title: GestureDetector(
        onTap: () {
          _navigateToCityPicker();
        },
        child: Row(
          children: [
            Text(
              _currentCity != null
                  ? 'CityPass tại ${_currentCity.name}'
                  : "Khám phá địa điểm mới",
              style: TextStyle(color: _foregroundColor),
            ),
            Icon(
              Icons.arrow_drop_down,
              color: _foregroundColor,
            ),
          ],
        ),
      ),
      bottom: _bottom,
    );
  }

  _navigateToCityPicker() async {
    final pickedCity = await Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) {
        return CityPicker();
      }),
    );

    if (pickedCity is City) {
      _changeCity(pickedCity);
    } else if (pickedCity is bool) {
      _removeCity();
    }
  }
}
