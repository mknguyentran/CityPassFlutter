import 'package:city_pass/mockupData/mockup_pass.dart';
import 'package:city_pass/model/activity.dart';
import 'package:city_pass/models/ticketTypeDetail.dart';
import 'package:city_pass/screens/map/map_screen.dart';
import 'package:city_pass/screens/pass_detail/pass_detail.dart';
import 'package:city_pass/models/ticketType.dart';
import 'package:city_pass/shared/pass_card.dart';
import 'package:city_pass/shared/timetable_row.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActivityInfo extends StatelessWidget {
  //final Activity activity;
  final TicketTypeDetail activity;
  const ActivityInfo({
    Key key,
    @required this.activity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              activity.description,
              style: TextStyle(fontSize: 14, height: 1.4),
            ),
          ),
          VerticalSpacing(of: 40),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Bao gồm trong các CityPass",
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
          ),
          VerticalSpacing(of: 20),
          SingleChildScrollView(
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...List.generate(
                    mockupPasses.length,
                    (index) => Padding(
                          padding: index != 0
                              ? EdgeInsets.only(left: 20)
                              : EdgeInsets.zero,
                          child: SizedBox(
                            width: 350,
                            child: PassCard(
                              pass: mockupPasses[index],
                              press: () => {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(builder: (context) {
                                    return PassDetail(
                                      pass: mockupPasses[index],
                                    );
                                  }),
                                )
                              },
                            ),
                          ),
                        )),
              ],
            ),
          ),
          VerticalSpacing(of: 40),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Bản đồ",
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
          ),
          VerticalSpacing(of: 20),
          GestureDetector(
            onTap: () => {
              Navigator.push(context, CupertinoPageRoute(builder: (context) {
                return MapScreen();
              })),
            },
            child: SizedBox(
              width: 400,
              child: Image.asset("assets/images/map_small.png"),
            ),
          ),
          VerticalSpacing(of: 40),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Thời gian hoạt động",
                            style: TextStyle(
                                fontSize: 21, fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                  VerticalSpacing(of: 10),
                  // Column(
                  //   children: [
                  //     ...List.generate(activity.activityTimetable.length,
                  //         (index) {
                  //       int todayWeekday = DateTime.now().weekday - 1;
                  //       return TimetableRow(
                  //         dayOfWeek:
                  //             activity.activityTimetable[index].dayOfWeek,
                  //         openTime:
                  //             activity.activityTimetable[index].openTime,
                  //         isToday: todayWeekday == index,
                  //       );
                  //     })
                  //   ],
                  // ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
