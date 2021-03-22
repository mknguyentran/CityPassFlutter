import 'package:city_pass/constants.dart';
import 'package:city_pass/model/user_pass.dart';
import 'package:city_pass/models/user_pass_available_show.dart';
import 'package:city_pass/screens/user_pass_detail/components/user_pass_detail_progress_bar.dart';
import 'package:city_pass/screens/user_pass_detail/components/user_pass_detail_top_info.dart';
import 'package:city_pass/screens/user_pass_detail/components/pass_usage/user_pass_detail_usage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserPassDetail extends StatefulWidget {
  final AvailableUserPass pass;

  const UserPassDetail({Key key, this.pass}) : super(key: key);

  @override
  _UserPassDetailState createState() => _UserPassDetailState();
}

class _UserPassDetailState extends State<UserPassDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding, vertical: 15),
          child: Column(
            children: [
              UserPassDetailTopInfo(pass: widget.pass),
              UserPassDetailProgressBar(pass: widget.pass),
              UserPassDetailUsage(pass: widget.pass,)
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      brightness: Brightness.light,
      leading: IconButton(
        icon: Icon(
          Icons.chevron_left_rounded,
          size: 30,
          color: primaryDarkColor,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      title: Text(
        widget.pass.name,
        style: TextStyle(
          color: textBlack,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
  }
}
