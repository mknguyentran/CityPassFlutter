import 'package:CityPass/models/activity.dart';
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
      appBar: AppBar(title: Text(widget.activity.name),),
      body: Text(widget.activity.name),
    );
  }
}
