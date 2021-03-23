import 'package:city_pass/blocs/auth_bloc.dart';
import 'package:city_pass/constants.dart';
import 'package:city_pass/models/user_pass_available_show.dart';
import 'package:city_pass/service/userpass_available_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    if(user != null) {
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
          AvailableUserPass passAvailable = snapshot.data;
          if (snapshot.hasData) {
            return Column(
              children: <Widget>[
                ...List.generate(
                  snapshot.data.length,
                  (index) => Card(
                      child: Row(
                    children: <Widget>[
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    NetworkImage(passAvailable.passImageUrl),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 0),
                            child: Text(passAvailable.passName,
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w500)),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: <Widget>[
                              Text("Hết hạn:",
                                  style: TextStyle(
                                      fontSize: 15, color: subtitleTextColor)),
                              SizedBox(width: 20),
                              Text(passAvailable.expiredDate.toString(),
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.redAccent,
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.lineThrough)),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: <Widget>[
                              Text(
                                "Còn hiệu lực",
                                style: TextStyle(
                                    color: subtitleTextColor, fontSize: 15),
                              ),
                              SizedBox(width: 45),
                              RaisedButton(
                                onPressed: clickToBookAgain,
                                color: primaryDarkColor,
                                child: Text(
                                  "Đặt lại",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6))),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  )),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      )),
    );
  }

  void clickToBookAgain() {
    setState(() {
      //  Navigator.push(context, MaterialPageRoute(builder: (context) => ));
    });
  }
}
