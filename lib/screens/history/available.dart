import 'package:city_pass/blocs/auth_bloc.dart';
import 'package:city_pass/constants.dart';
import 'package:city_pass/models/passDetailInformation.dart';
import 'package:city_pass/models/user_pass_available_show.dart';
import 'package:city_pass/screens/pass_detail/pass_detail.dart';
import 'package:city_pass/service/userpass_available_service.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_guid/flutter_guid.dart';
import 'package:provider/provider.dart';
import 'package:flutter_guid/flutter_guid.dart';

class AvailablePass extends StatefulWidget {
  @override
  _AvailablePassState createState() => _AvailablePassState();
}

class _AvailablePassState extends State<AvailablePass> {
  Future<List<AvailableUserPass>> availablePass;
  @override
  void initState() {
    super.initState();
    var authBloc = Provider.of<AuthBloc>(context, listen: false);
    var user = authBloc.currentUser;
    String defaultUser = "123456789qwertyu";
    if (user != null) {
      defaultUser = user.uid;
    }
    availablePass = UserPassAvailableAPI().getAllAvailablePass((msg) {
      print(msg);
    }, defaultUser);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
          child: FutureBuilder(
        future: availablePass,
        builder: (context, snapshot) {
          List<AvailableUserPass> passAvailable = snapshot.data;
          if (snapshot.hasData) {
            return Column(
              children: <Widget>[
                ...List.generate(
                  snapshot.data.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Card(
                        child: Row(
                      children: <Widget>[
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      passAvailable[index].passImageUrl),
                                  fit: BoxFit.cover)),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 7),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  passAvailable[index].passName,
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text("Hết hạn:",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: subtitleTextColor)),
                                    SizedBox(width: 20),
                                    Text(
                                        simpleDateAndTimeFormat.format(
                                          passAvailable[index].expiredDate,
                                        ),
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: subtitleTextColor)),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "Còn hiệu lực",
                                      style: TextStyle(
                                          color: subtitleTextColor,
                                          fontSize: 15),
                                    ),
                                    SizedBox(
                                      height: 30,
                                      child: RaisedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            CupertinoPageRoute(
                                                builder: (context) {
                                              return PassDetail(
                                                  passId: new Guid(
                                                      passAvailable[index]
                                                          .passID));
                                            }),
                                          );
                                        },
                                        color: primaryDarkColor,
                                        child: Text(
                                          "Đặt lại",
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 17),
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(6))),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            );
          }
          return Container(
            height: percentageOfScreenHeight(20),
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          );
        },
      )),
    );
  }
}
