import 'package:city_pass/blocs/auth_bloc.dart';
import 'package:city_pass/constants.dart';
import 'package:city_pass/models/user_pass_available_show.dart';
import 'package:city_pass/screens/user_pass_detail/user_pass_detail.dart';
import 'package:city_pass/service/userpass_available_service.dart';
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
  @override
  void initState() {
    super.initState();
    String defaultUser = "123456789qwertyu";
    var authBloc = Provider.of<AuthBloc>(context, listen: false);
    var user = authBloc.currentUser;
    
    if(user != null) {
      defaultUser = user.uid;
    }
    listUserpassAvailable = UserPassAvailableAPI().getAllAvailablePass((msg) {
      print(msg);
    }, defaultUser);
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
                if (snapshot.hasData) {
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
                                );
                              }),
                        ),
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
