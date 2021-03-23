import 'dart:ui';

import 'package:city_pass/models/city.dart';
import 'package:city_pass/screens/home/components/account/account.dart';
import 'package:city_pass/screens/home/components/account/login_register/login.dart'; 
import 'package:city_pass/screens/home/components/city_picker/city_picker.dart';
import 'package:city_pass/screens/home/components/search/search.dart';
import 'package:city_pass/screens/home/components/explore/explore.dart';
import 'package:city_pass/shared/geolocator.dart';
import 'package:city_pass/shared/search_field.dart';
import 'package:city_pass/screens/home/components/location/location.dart';
import 'package:city_pass/screens/home/components/passes/passes.dart';
import 'package:city_pass/screens/user_passes/user_passes.dart';
import 'package:city_pass/shared/custom_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:city_pass/constants.dart';
import 'package:city_pass/size_config.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import '../../blocs/auth_bloc.dart';

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
  bool isFirstTime = true;

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

  Future<List<Placemark>> getCurrentLocations() async {
    List<Placemark> tmp;

    Position currentPosition = await GeolocatorUtil().determinePosition();
    tmp = await placemarkFromCoordinates(currentPosition.latitude, currentPosition.longitude);
    return tmp;
  }

  @override
  Widget build(BuildContext context) {
    var authBloc = Provider.of<AuthBloc>(context, listen: false);

    initializeDateFormatting("vi_VN", null);
    SizeConfig().init(context);
    if (isFirstTime) {
      getCurrentLocations().then((value) {
        this.setState(() {
          isFirstTime = false;
        });

        if (value[0].administrativeArea.contains('Minh')) {
          this.setState(() {
            _currentCity = City('TP. Hồ Chí Minh', id: 1);            
          });
        }
      });
    }
    tabs = [
      Explore(city: _currentCity),
      Locations(city: _currentCity),
      UserPasses(),
      Passes(city: _currentCity),
      Account()
    ];
    return Scaffold(
      appBar: buildAppBar(_currentIndex),
      body: tabs.elementAt(_currentIndex),
      backgroundColor: lightGrayBackground,
      extendBodyBehindAppBar: _currentIndex == 4,
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
    var _brightness = Brightness.dark;
    var _foregroundColor = Colors.white;
    var _bottom = PreferredSize(
      preferredSize: Size.fromHeight(55),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding).add(
            const EdgeInsets.only(bottom: 10),
          ),
          // child: SearchField(
          //   height: 40,
          //   width: double.infinity,
          //   hintText: "Tìm kiếm điểm đến, hoạt đông,...",
          //   boxShadow: [kDefaultShadow],
          //   onTap: () {
          //     Navigator.push(
          //     context,
          //     CupertinoPageRoute(builder: (context) {
          //       return SearchPage();
          //     }),
          //   );
          //   },
          // ),
          child: Container(
            height: 40,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [kDefaultShadow],
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) {
                    return SearchPage(city: _currentCity);
                  }),
                );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: kDefaultPadding, vertical: 12),
                child: Text(
                  'Tìm kiếm combo, địa điểm, ...',
                  style: TextStyle(fontSize: 12, color: primaryDarkColor),
                ),
              ),
            ),
          )),
    );
    if (tab == 4) {
      return AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        elevation: 0,
      );
    }
    return AppBar(
      shadowColor: secondaryColor,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [primaryDarkColor, secondaryColor]),
        ),
      ),
      brightness: _brightness,
      elevation: 5,
      leading: Container(),
      centerTitle: false,
      leadingWidth: 0,
      titleSpacing: kDefaultPadding,
      title: GestureDetector(
        onTap: () {
          _navigateToCityPicker();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hiển thị đề xuất tại".toUpperCase(),
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
            ),
            VerticalSpacing(of: 3),
            Row(
              children: [
                Text(
                  _currentCity != null ? _currentCity.name : "Việt Nam",
                  style: TextStyle(
                      color: _foregroundColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: _foregroundColor,
                ),
              ],
            ),
          ],
        ),
      ),
      // title: GestureDetector(
      //   child: Text("CityPass"),
      //   onTap: () {
      //     _onItemTapped(0);
      //   },
      // ),
      // bottom: _bottom,
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
