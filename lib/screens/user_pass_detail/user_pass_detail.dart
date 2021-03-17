import 'package:city_pass/constants.dart';
import 'package:city_pass/model/user_pass.dart';
import 'package:city_pass/screens/user_pass_detail/components/user_pass_detail_progress_bar.dart';
import 'package:city_pass/screens/user_pass_detail/components/user_pass_detail_top_info.dart';
import 'package:city_pass/screens/user_pass_detail/components/pass_usage/user_pass_detail_usage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserPassDetail extends StatelessWidget {
  final UserPass pass;

  const UserPassDetail({Key key, this.pass}) : super(key: key);

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
              UserPassDetailTopInfo(pass: pass),
              UserPassDetailProgressBar(pass: pass),
              UserPassDetailUsage(pass: pass,)
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
        pass.name,
        style: TextStyle(
          color: textBlack,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
  }
}
