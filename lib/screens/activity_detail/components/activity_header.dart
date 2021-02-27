import 'package:city_pass/constants.dart';
import 'package:city_pass/models/activity.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/material.dart';

class ActivityHeader extends StatelessWidget {
  final Activity activity;
  const ActivityHeader({
    Key key,
    @required this.activity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          height: percentageOfScreenHeight(30),
          child: SizedBox.expand(
            child: Image.asset(activity.image, fit: BoxFit.cover),
          ),
        ),
        Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
              width: MediaQuery.of(context).size.width,
              color: Colors.black.withOpacity(0.6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    activity.name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  VerticalSpacing(of: 15),
                  Row(
                    children: [
                      Container(
                          padding: EdgeInsets.only(right: 5),
                          child: Icon(
                            Icons.circle,
                            size: 16,
                            color: primaryLightColor,
                          )),
                      Text(
                        "Đang hoạt động",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      )
                    ],
                  ),
                  VerticalSpacing(of: 5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: EdgeInsets.only(right: 5),
                          child: Icon(
                            Icons.location_on_rounded,
                            size: 16,
                            color: Colors.yellow.shade700,
                          )),
                      Expanded(
                        child: Text(
                          "2 Nguyễn Bỉnh Khiêm, Bến Nghé, Quận 1",
                          style: TextStyle(
                            fontSize: 14,
                            height: 1.2,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ))
      ],
    );
  }
}
