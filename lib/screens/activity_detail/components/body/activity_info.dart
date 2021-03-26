
import 'package:city_pass/models/pass.dart';
import 'package:city_pass/models/ticketTypeDetail.dart';
import 'package:city_pass/screens/map/map_screen.dart';
import 'package:city_pass/screens/pass_detail/pass_detail.dart';
import 'package:city_pass/service/pass_services.dart';
import 'package:city_pass/shared/pass_card.dart';
import 'package:city_pass/shared/timetable_row.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../constants.dart';

class ActivityInfo extends StatefulWidget {
  final TicketTypeDetail activity;

  const ActivityInfo({
    Key key,
    @required this.activity,
  }) : super(key: key);

  @override
  _ActivityInfoState createState() => _ActivityInfoState();
}

class _ActivityInfoState extends State<ActivityInfo> {
  Future<List<Pass>> listPass;
  GoogleMapController mapController;
  Set<Marker> _markers;

  @override
  void initState() {
    super.initState();
    listPass =
        PassAPI().getAllPasses(ticketTypeId: widget.activity.id.toString());
  }

  Set<Marker> generateMapMarkers() {
    Marker currentLocation = Marker(
      markerId: MarkerId(widget.activity.id.toString()),
      position: LatLng(widget.activity.latitude, widget.activity.longitude),
      infoWindow: InfoWindow(
        title: widget.activity.attractionName,
        snippet: widget.activity.address,
      )
    );

    Set<Marker> markers = new Set();
    markers.add(currentLocation);
    return markers;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.activity.description,
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
            child: FutureBuilder(
              future: listPass,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Pass> listPass = snapshot.data;
                  return Row(
                    children: [
                      ...List.generate(
                          listPass.length,
                          (index) => Padding(
                                padding: index != 0
                                    ? EdgeInsets.only(left: 20)
                                    : EdgeInsets.zero,
                                child: SizedBox(
                                  width: 350,
                                  child: PassCard(
                                    pass: listPass[index],
                                    press: () => {
                                      Navigator.push(
                                        context,
                                        CupertinoPageRoute(builder: (context) {
                                          return PassDetail(
                                            passId: listPass[index].id,
                                          );
                                        }),
                                      )
                                    },
                                  ),
                                ),
                              )),
                    ],
                  );
                }
                return CircularProgressIndicator();
              },
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
          // GestureDetector(
          //   onTap: () => {
          //     Navigator.push(context, CupertinoPageRoute(builder: (context) {
          //       return MapScreen();
          //     })),
          //   },
          //   child: SizedBox(
          //     width: 400,
          //     child: Image.asset("assets/images/map_small.png"),
          //   ),
          // ),
          Container(
            height: 300,
            child: GoogleMap(
              onMapCreated: (controller) { mapController = controller; },
              initialCameraPosition: CameraPosition(
                target: LatLng(widget.activity.latitude, widget.activity.longitude),
                zoom: 11.0
              ),
              markers: generateMapMarkers(),
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
                  Column(
                    children: [
                      ...List.generate(activityTimetable.length, (index) {
                        int todayWeekday = DateTime.now().weekday - 1;
                        return TimetableRow(
                          dayOfWeek: activityTimetable[index].dayOfWeek,
                          openTime: activityTimetable[index].openTime,
                          isToday: todayWeekday == index,
                        );
                      })
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
