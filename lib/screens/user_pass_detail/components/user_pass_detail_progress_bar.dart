import 'package:city_pass/constants.dart';
import 'package:city_pass/model/user_pass.dart';
import 'package:city_pass/models/user_pass_available_show.dart';
import 'package:flutter/material.dart';

class UserPassDetailProgressBar extends StatelessWidget {
  const UserPassDetailProgressBar({
    Key key, @required this.pass,
  }) : super(key: key);

  final AvailableUserPass pass;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [kDefaultShadow],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Đã sử dụng:".toUpperCase(),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "${pass.usedDestination}/${pass.totalDestination}",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: primaryLightColor,
                ),
              ),
              Text(
                "địa điểm".toUpperCase(),
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
