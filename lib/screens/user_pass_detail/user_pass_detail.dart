import 'package:city_pass/constants.dart';
import 'package:city_pass/models/user_pass_available_show.dart';
import 'package:city_pass/models/userpass_use_history.dart';
import 'package:city_pass/screens/user_pass_detail/components/pass_usage/user_pass_detail_usage.dart';
import 'package:city_pass/screens/user_pass_detail/components/user_pass_detail_progress_bar.dart';
import 'package:city_pass/screens/user_pass_detail/components/user_pass_detail_top_info.dart';
import 'package:city_pass/service/userpass_history_service.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserPassDetail extends StatefulWidget {
  final AvailableUserPass availableUserPass;

  const UserPassDetail({Key key, this.availableUserPass}) : super(key: key);

  @override
  _UserPassDetailState createState() => _UserPassDetailState();
}

class _UserPassDetailState extends State<UserPassDetail> {
  Future<UserPassHistory> historyDetail;
  @override
  void initState() {
    super.initState();
    historyDetail = UserPassHistoryAPI().getHistoryUserPass((msg) {
      print(msg);
    }, widget.availableUserPass.userPassID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding, vertical: 15),
          child: FutureBuilder(
            future: historyDetail,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    UserPassDetailTopInfo(
                        availableUserPass: widget.availableUserPass),
                    UserPassDetailProgressBar(userPassHistory: snapshot.data),
                    UserPassDetailUsage(
                      userPassHistory: snapshot.data,
                    )
                  ],
                );
              }
              return Container(
                height: percentageOfScreenHeight(20),
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              );
            },
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
        widget.availableUserPass.passName,
        style: TextStyle(
          color: textBlack,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(
            CupertinoIcons.home,
            color: primaryDarkColor,
          ),
          onPressed: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
        )
      ],
    );
  }
}
