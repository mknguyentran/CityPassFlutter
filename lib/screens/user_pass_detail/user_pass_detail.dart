import 'package:city_pass/constants.dart';
import 'package:city_pass/models/user_pass.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class UserPassDetail extends StatelessWidget {
  final UserPass pass;

  const UserPassDetail({Key key, this.pass}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      backgroundColor: lightGrayBackground,
      body: Padding(
        padding:
            const EdgeInsets.fromLTRB(kDefaultPadding, 25, kDefaultPadding, 0),
        child: Column(
          children: [
            Text(
              "Đưa mã này cho nhân viên soát vé",
              style: TextStyle(fontSize: 16),
            ),
            Container(
              padding: EdgeInsets.all(kDefaultPadding),
              alignment: Alignment.center,
              child: QrImage(
                data: pass.name,
                version: QrVersions.auto,
                size: percentageOfScreenHeight(30),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                pass.name,
                style: TextStyle(
                  color: primaryDarkColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            )
          ],
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
        style: TextStyle(color: textBlack, fontWeight: FontWeight.bold,),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(Icons.ios_share),
          color: primaryDarkColor,
          onPressed: () {},
        )
      ],
    );
  }
}
