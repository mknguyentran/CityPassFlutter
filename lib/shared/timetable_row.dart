import 'package:city_pass/constants.dart';
import 'package:flutter/material.dart';

class TimetableRow extends StatelessWidget {
  const TimetableRow({
    Key key,
    @required this.dayOfWeek,
    @required this.openTime,
    this.isToday,
  }) : super(key: key);

  final String dayOfWeek;
  final String openTime;
  final bool isToday;

  @override
  Widget build(BuildContext context) {
    var _fontSize = 15.0;
    return Container(
      padding: EdgeInsets.only(bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              dayOfWeek,
              style: TextStyle(
                fontSize: _fontSize,
                color: isToday ? primaryLightColor : null,
                fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(
              openTime,
              style: TextStyle(
                fontSize: _fontSize,
                color: isToday ? primaryLightColor : null,
                fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          )
        ],
      ),
    );
  }
}
