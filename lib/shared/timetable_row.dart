import 'package:flutter/material.dart';

class TimetableRow extends StatelessWidget {
  const TimetableRow({
    Key key,
    @required this.dayOfWeek,
    @required this.openTime
  }) : super(key: key);

  final String dayOfWeek;
  final String openTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                dayOfWeek,
                style: TextStyle(
                  color: dayOfWeek == "Thứ bảy" ? Colors.green : null
                ),
              )
            ],
          ),
          Column(
            children: [
              Text(
                openTime,
                style: TextStyle(
                  color: dayOfWeek == "Thứ bảy" ? Colors.green : null
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}