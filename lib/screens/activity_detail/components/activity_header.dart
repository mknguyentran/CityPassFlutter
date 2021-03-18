import 'package:city_pass/model/activity.dart';
import 'package:city_pass/models/ticketType.dart';
import 'package:city_pass/models/ticketTypeDetail.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/material.dart';

class ActivityHeader extends StatelessWidget {
  
  final TicketTypeDetail activity;
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
            child: Image.asset(activity.urlImage ?? '', fit: BoxFit.cover),
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
                            color: Colors.green,
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
                          activity.address,
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
