import 'package:city_pass/models/activity.dart';
import 'package:city_pass/screens/activity_detail/components/activity_header.dart';
import 'package:city_pass/screens/activity_detail/components/body/activity_body.dart';
import 'package:flutter/material.dart';

class ActivityDetail extends StatefulWidget {
  final Activity activity;

  const ActivityDetail({Key key, @required this.activity}) : super(key: key);

  @override
  _ActivityDetailState createState() => _ActivityDetailState();
}

class _ActivityDetailState extends State<ActivityDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: Column(
          children: [
            ActivityHeader(activity: widget.activity,),
            ActivityBody()
          ],
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
        IconButton(icon: Icon(Icons.favorite_border_rounded), onPressed: () {})
      ],
    );
  }
}
