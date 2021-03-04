import 'package:city_pass/screens/home/components/account/login_register/login.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';


class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: GestureDetector(
        child: Text("Login here"),
        onTap: clickToLogin,
      ),
    );
  
}



  void clickToLogin(){
    setState(() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginForm()));
    });
  }
}

