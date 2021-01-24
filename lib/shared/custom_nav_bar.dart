import 'package:CityPass/constants.dart';
import 'package:CityPass/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenWidth(80),
      decoration: BoxDecoration(
        boxShadow: [kDefaultShadow],
        color: Colors.white,
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(kDefaultPadding),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavItem(
                icon: Icons.star,
                title: "Đề xuất",
                isSelected: true,
                press: () {},
              ),
              NavItem(
                icon: Icons.qr_code_rounded,
                title: "CityPass",
                isFocused: true,
                press: () {},
              ),
              NavItem(
                icon: Icons.list_alt_rounded,
                title: "Lịch sử",
                press: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  const NavItem({
    Key key,
    @required this.icon,
    @required this.title,
    @required this.press,
    this.isSelected = false,
    this.isFocused = false,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final bool isSelected;
  final bool isFocused;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: EdgeInsets.all(5),
        height: getProportionateScreenWidth(60),
        width: getProportionateScreenWidth(60),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [if (isFocused) kDefaultShadow],
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: 28,
              color: isSelected ? cityPassDarkColor : kTextColor,
            ),
            Spacer(),
            Text(
              title,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: isSelected ? cityPassDarkColor : kTextColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
