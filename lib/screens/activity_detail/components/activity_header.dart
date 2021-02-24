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
          child: SizedBox.expand(
              child: Image.asset(activity.image, fit: BoxFit.cover)
          )
        ),
        Positioned(
          bottom: 0,
          child: Container(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            height: 125,
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
                    color: Colors.white
                  ),
                ),
                VerticalSpacing(of: 5),
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Container(
                          padding: EdgeInsets.only(right: 5),
                          child: Icon(
                            Icons.circle,
                            size: 16,
                            color: Colors.green,
                          )
                        )
                      ),
                      TextSpan(
                        text: "Đang hoạt động",
                        style: TextStyle(fontSize: 16)
                      )
                    ],
                  ),
                ),
                VerticalSpacing(of: 5),
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Container(
                          padding: EdgeInsets.only(right: 5),
                          child: Icon(
                            Icons.location_on_rounded,
                            size: 16,
                            color: Colors.yellow,
                          )
                        )
                      ),
                      TextSpan(
                        text: "2 Nguyễn Bỉnh Khiêm, Bến Nghé, Quận 1, Thành phố Hồ Chí Minh",
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.4
                        )
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        )
      ],
    );
  }
}
