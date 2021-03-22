import 'package:city_pass/constants.dart';
import 'package:city_pass/screens/history/history.dart';
import 'package:city_pass/screens/home/components/account/login_register/login.dart';
import 'package:city_pass/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../blocs/auth_bloc.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  User _user;
  @override
  void initState() {
    super.initState();
    var authBloc = Provider.of<AuthBloc>(context, listen: false);
    authBloc.currentUser.listen((user) {
      if (user == null) {
        setState(() {
          Navigator.push(
              context, CupertinoPageRoute(builder: (context) => LoginForm()));
        });
      }
      setState(() {
        _user = user;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    //var user = context.select<AuthBloc, User>((value) => value.currentUser.first);
    var authBloc = Provider.of<AuthBloc>(context);
    return SingleChildScrollView(
        child: Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: 50),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Container(
                    width: 100,
                    height: 100,
                    child: Image(
                      width: 100,
                      height: 100,
                      image: NetworkImage(_user != null ? _user.photoURL : ''),
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 1, color: Colors.red)),
                  )),
              SizedBox(
                height: 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _user != null ? _user.displayName : '',
                      style: TextStyle(
                          fontSize: 20,
                          color: primaryDarkColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Chỉnh sửa thông tin",
                      style: TextStyle(fontSize: 16, color: primaryLightColor),
                    ),
                  ],
                ),
              )
            ],
          ),
          VerticalSpacing(of: 10),
          Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [kDefaultShadow],
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: clickToHistory,
                    child: ListTile(
                      dense: true,
                      leading: Icon(
                        Icons.history,
                        color: Colors.yellow.shade700,
                      ),
                      title: Text("Lịch sử giao dịch"),
                    ),
                  ),
                ],
              )),
          VerticalSpacing(of: 20),
          Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [kDefaultShadow],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  ListTile(
                    dense: true,
                    leading: Icon(
                      Icons.mail,
                      color: Colors.yellow.shade700,
                    ),
                    title: Text("Gửi phản hồi"),
                  ),
                  Divider(thickness: 1),
                  ListTile(
                    dense: true,
                    leading: Icon(
                      Icons.people,
                      color: primaryDarkColor,
                    ),
                    title: Text("Về CityPass"),
                  ),
                ],
              )),
          VerticalSpacing(of: 50),
          GestureDetector(
              onTap: () {
                authBloc.logout();
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) {
                      return LoginForm();
                    },
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(3, 3),
                        blurRadius: 10,
                        color: Color(0xFFE5B4AA).withOpacity(0.3),
                      )
                    ],
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Đăng xuất",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ))
        ],
      ),
    ));
  }

  void clickToHistory() {
    setState(() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HistoryForm()));
    });
  }
}
