import 'package:city_pass/constants.dart';
import 'package:city_pass/model/user_pass.dart';
import 'package:flutter/material.dart';

class UsedDestinations extends StatelessWidget {
  final List<dynamic> entryList;

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
              Expanded(
                flex: 3,
                child: Text(
                  entryList[index]["name"],
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  simpleDateAndTimeFormat.format(entryList[index]["usedAt"]),
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.right,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
