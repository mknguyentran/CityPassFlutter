import 'package:city_pass/blocs/auth_bloc.dart';
import 'package:city_pass/models/user_pass_outdated_show.dart';
import 'package:city_pass/screens/pass_detail/pass_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:city_pass/service/outdated_pass_service.dart';
import 'package:provider/provider.dart';
import 'package:flutter_guid/flutter_guid.dart';

import '../../constants.dart';

class OutDatedPass extends StatefulWidget {
  @override
  _OutDatedPassState createState() => _OutDatedPassState();
}

class _OutDatedPassState extends State<OutDatedPass> {
  Future<List<OutdatedUserPass>> listOutdatedPass;

  @override
  void initState() {
    super.initState();
    var authBloc = Provider.of<AuthBloc>(context, listen: false);
    var user = authBloc.currentUser;
    String defaultUser = "123456789qwertyu";
    if (user != null) {
      defaultUser = user.uid;
    }
    listOutdatedPass = OutDatedPassAPI().getAllOutdatedPass((msg) {
      print(msg);
    }, defaultUser);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
          child: FutureBuilder(
        future: listOutdatedPass,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<OutdatedUserPass> outdatedPass = snapshot.data;
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
                                      outdatedPass[index].passImageUrl),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 0),
                              child: Text(outdatedPass[index].passName,
                                  style: TextStyle(
                                      fontSize: 17, fontWeight: FontWeight.w500)),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: <Widget>[
                                Text(
                                  "Hết hiệu lực",
                                  style: TextStyle(
                                      color: subtitleTextColor, fontSize: 15),
                                ),
                                SizedBox(width: 45),
                                RaisedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      CupertinoPageRoute(builder: (context) {
                                        return PassDetail(
                                            passId: new Guid(
                                                outdatedPass[index].passID));
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
}
