import 'package:city_pass/constants.dart';
import 'package:city_pass/models/user_pass.dart';
import 'package:city_pass/screens/user_pass_detail/user_pass_detail.dart';
import 'package:city_pass/shared/user_pass_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserPasses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(context),
        backgroundColor: lightGrayBackground,
        body: Padding(
          padding: EdgeInsets.all(kDefaultPadding),
          child: SingleChildScrollView(
            clipBehavior: Clip.none,
            child: Column(
              children: [
                ...List.generate(
                  UserPass.mockupUserPasses.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: UserPassCard(
                        pass: UserPass.mockupUserPasses[index],
                        press: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(builder: (context) {
                              return UserPassDetail(
                                pass: UserPass.mockupUserPasses[index],
                              );
                            }),
                          );
                        }),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

AppBar _buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    brightness: Brightness.light,
    leading: IconButton(
      color: primaryDarkColor,
      icon: Icon(
        Icons.chevron_left_rounded,
        size: 30,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    ),
    title: Text(
      "CityPass của bạn",
      style: TextStyle(color: textBlack),
    ),
    centerTitle: true,
  );
}
