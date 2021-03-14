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
                  color: isToday ? Colors.green : null,
                  fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                ),
              )
            ],
          ),
          Column(
            children: [
              Text(
                openTime,
                style: TextStyle(
                  color: isToday ? Colors.green : null,
                  fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
