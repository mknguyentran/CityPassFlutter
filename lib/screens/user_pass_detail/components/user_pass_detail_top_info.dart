import 'package:city_pass/constants.dart';
import 'package:city_pass/models/user_pass.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class UserPassDetailTopInfo extends StatelessWidget {
  const UserPassDetailTopInfo({
    Key key,
    @required this.pass,
  }) : super(key: key);

  final UserPass pass;

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
          child: QrImage(
            data: pass.name,
            version: QrVersions.auto,
            size: percentageOfScreenHeight(27),
          ),
        ),
        Text(
          "HẾT HẠN VÀO ${simpleDateFormat.format(pass.expiredAt)}"
              .toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: () {},
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
}