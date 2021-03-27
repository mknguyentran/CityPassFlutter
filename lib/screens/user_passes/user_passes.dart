import 'package:city_pass/blocs/auth_bloc.dart';
import 'package:city_pass/constants.dart';
import 'package:city_pass/models/user_pass_available_show.dart';
import 'package:city_pass/screens/home/components/account/login_register/login.dart';
import 'package:city_pass/screens/user_pass_detail/user_pass_detail.dart';
import 'package:city_pass/service/userpass_available_service.dart';
import 'package:city_pass/shared/push_notification_util.dart';
import 'package:city_pass/shared/user_pass_card.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserPasses extends StatefulWidget {
  @override
  _UserPassesState createState() => _UserPassesState();
}

class _UserPassesState extends State<UserPasses> {
  Future<List<AvailableUserPass>> listUserpassAvailable;
  var _user;

  String defaultUser = "rlGWU9R0bkSEByvoDXjWHpiaCvr1";
  @override
  void initState() {
    super.initState();
    var authBloc = Provider.of<AuthBloc>(context, listen: false);
    _user = authBloc.currentUser;

    if (_user != null) {
      listUserpassAvailable = UserPassAvailableAPI().getAllAvailablePass(
        (msg) {
          print(msg);
        },
        _user.uid,
      );
    }
  }

  void _reload() {
    if (_user == null) {
      var authBloc = Provider.of<AuthBloc>(context, listen: false);
      _user = authBloc.currentUser;
    }
    if (_user != null) {
      setState(
        () {
          listUserpassAvailable = UserPassAvailableAPI().getAllAvailablePass(
            (msg) {
              print(msg);
            },
            _user.uid,
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(context),
        backgroundColor: lightGrayBackground,
        body: Padding(
          padding: EdgeInsets.all(kDefaultPadding),
          child: SingleChildScrollView(
            clipBehavior: Clip.none,
            child: FutureBuilder(
              future: listUserpassAvailable,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Column(
                    children: [
                      ...List.generate(
                        snapshot.data.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: UserPassCard(
                              pass: snapshot.data[index],
                              press: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(builder: (context) {
                                    return UserPassDetail(
                                      availableUserPass: snapshot.data[index],
                                    );
                                  }),
                                ).then((value) => _reload());
                              }),
                        ),
                      )
                    ],
                  );
                } else if (_user != null) {
                  return Container(
                    height: percentageOfScreenHeight(20),
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(primaryLightColor),
                    ),
                  );
                } else {
                  return Container(
                    width: percentageOfScreenWidth(100),
                    height: percentageOfScreenHeight(50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Hãy đăng nhập để xem các combo đã mua",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                        VerticalSpacing(
                          of: 15,
                        ),
                        Container(
                          width: 200,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => LoginForm(),
                                ),
                              ).then((value) => _reload());
                            },
                            child: Text(
                              "Đăng nhập",
                              style: TextStyle(fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(primaryLightColor),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }
              },
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
        CupertinoIcons.chevron_down,
        size: 22,
        color: primaryDarkColor,
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
