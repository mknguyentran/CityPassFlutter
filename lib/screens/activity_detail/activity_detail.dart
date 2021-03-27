import 'package:city_pass/constants.dart';
import 'package:city_pass/model/activity.dart';
import 'package:city_pass/models/ticketTypeDetail.dart';
import 'package:city_pass/screens/activity_detail/components/activity_header.dart';
import 'package:city_pass/screens/activity_detail/components/body/activity_body.dart';
import 'package:city_pass/models/ticketType.dart';
import 'package:city_pass/service/ticketType_services.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_guid/flutter_guid.dart';

class ActivityDetail extends StatefulWidget {
  // final TicketTypeDetail activity;
  final Guid ticketTypeID;

  const ActivityDetail({
    Key key,
    //  @required this.activity,
    @required this.ticketTypeID,
  }) : super(key: key);

  @override
  _ActivityDetailState createState() => _ActivityDetailState();
}

class _ActivityDetailState extends State<ActivityDetail> {
  Future<TicketTypeDetail> ticketTypeDetail;
  @override
  void initState() {
    super.initState();
    ticketTypeDetail = TicketTypeAPI().getTicketTypeByID(
        onError: (msg) {
          print(msg);
        },
        id: widget.ticketTypeID.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: FutureBuilder(
          future: ticketTypeDetail,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  ActivityHeader(activity: snapshot.data),
                  ActivityBody(activity: snapshot.data),
                ],
              );
            }
            return Container(
              height: percentageOfScreenHeight(100),
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(primaryLightColor),
              ),
            );
          },
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      brightness: Brightness.dark,
      leading: IconButton(
        icon: Icon(
          Icons.chevron_left_rounded,
          size: 30,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      actions: [
        IconButton(
          icon: Icon(CupertinoIcons.home),
          onPressed: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
        )
      ],
    );
  }
}
