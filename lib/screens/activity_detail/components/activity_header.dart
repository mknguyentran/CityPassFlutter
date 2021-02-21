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
          height: getProportionateScreenWidth(280),
          child: SizedBox.expand(child: Image.asset(activity.image, fit: BoxFit.cover))
        ),
        Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.fromLTRB(15,10,15,10),
              height: 100,
              width: MediaQuery.of(context).size.width,
              color: Colors.black.withOpacity(0.6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    activity.name,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: Colors.green,
                        size: 18,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          "Đang hoạt động",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_rounded,
                        color: Colors.yellow,
                        size: 18,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          "Địa chỉ",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ))
      ],
    );
  }
}
