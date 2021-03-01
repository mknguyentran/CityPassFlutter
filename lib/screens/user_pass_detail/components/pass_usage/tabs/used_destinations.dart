import 'package:city_pass/constants.dart';
import 'package:city_pass/models/user_pass.dart';
import 'package:flutter/material.dart';

class UsedDestinations extends StatelessWidget {
  final List<UserPassHistoryEntry> entryList;

  const UsedDestinations({Key key, @required this.entryList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
          entryList.length,
          (index) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                entryList[index].destination,
                style: TextStyle(fontSize: 14),
              ),
              Text(
                simpleDateAndTimeFormat.format(entryList[index].usedAt),
                style: TextStyle(fontSize: 14),
              )
            ],
          ),
        )
      ],
    );
  }
}