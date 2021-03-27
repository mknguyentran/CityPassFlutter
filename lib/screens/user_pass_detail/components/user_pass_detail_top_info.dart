import 'package:city_pass/constants.dart';
import 'package:city_pass/model/user_pass.dart';
import 'package:city_pass/models/user_pass_available_show.dart';
import 'package:city_pass/screens/pass_detail/pass_detail.dart';
import 'package:city_pass/size_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_guid/flutter_guid.dart';
import 'package:qr_flutter/qr_flutter.dart';

class UserPassDetailTopInfo extends StatefulWidget {
  const UserPassDetailTopInfo({
    Key key,
    @required this.availableUserPass,
  }) : super(key: key);

  final AvailableUserPass availableUserPass;

  @override
  _UserPassDetailTopInfoState createState() => _UserPassDetailTopInfoState();
}

class _UserPassDetailTopInfoState extends State<UserPassDetailTopInfo> {
  Future<String> _deviceToken;
  @override
  void initState() {
    super.initState();
    _deviceToken = FirebaseMessaging.instance.getToken();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Đưa mã này cho nhân viên soát vé",
          style: TextStyle(fontSize: 16),
        ),
        Container(
          padding: EdgeInsets.all(kDefaultPadding),
          alignment: Alignment.center,
          child: GestureDetector(
              onLongPress: _showUserPassIDDialog,
              child: FutureBuilder(
                future: _deviceToken,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return QrImage(
                      data: widget.availableUserPass.userPassID +
                          ' ' +
                          snapshot.data,
                      version: QrVersions.auto,
                      size: percentageOfScreenHeight(27),
                    );
                  }

                  return CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(primaryLightColor),
                  );
                },
              )),
        ),
        Text(
          "HẾT HẠN VÀO ${simpleDateFormat.format(widget.availableUserPass.expiredDate)}"
              .toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) {
                  return PassDetail(
                    passId: new Guid(widget.availableUserPass.passID),
                  );
                },
              ),
            );
          },
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(primaryLightColor),
            textStyle: MaterialStateProperty.all(
              TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          child: SizedBox(
            width: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(CupertinoIcons.arrow_counterclockwise_circle_fill),
                Text("Mua lại")
              ],
            ),
          ),
        )
      ],
    );
  }

  Future<void> _showUserPassIDDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('${widget.availableUserPass.userPassID.toUpperCase()}'),
          actions: [
            TextButton(
              child: Text('Ok'.toUpperCase()),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
