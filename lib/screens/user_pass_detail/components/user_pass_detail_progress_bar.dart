import 'package:city_pass/constants.dart';

import 'package:city_pass/models/userpass_use_history.dart';

import 'package:flutter/material.dart';

class UserPassDetailProgressBar extends StatefulWidget {
  const UserPassDetailProgressBar({
    Key key,
    @required this.userPassHistory,
  }) : super(key: key);

  final UserPassHistory userPassHistory;

  @override
  _UserPassDetailProgressBarState createState() =>
      _UserPassDetailProgressBarState();
}

class _UserPassDetailProgressBarState extends State<UserPassDetailProgressBar> {
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
                "${widget.userPassHistory.usedList.length}/${widget.userPassHistory.unusedList.length + widget.userPassHistory.usedList.length}",
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
