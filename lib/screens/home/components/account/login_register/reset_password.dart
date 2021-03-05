import 'package:city_pass/screens/home/components/account/login_register/login.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _confirmPassController = new TextEditingController();

  bool _invalidPassword = false;
  bool _invalidPassConfirm = false;

  var _passwordError = "Mật khẩu phải từ 6-12 kí tự";
  var _passwordConfirmError = "Mật khẩu xác nhận không hợp lệ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints.expand(),
        child: Padding(
          padding:
              const EdgeInsets.fromLTRB(kDefaultPadding, 0, kDefaultPadding, 0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Container(
                    child: Image.asset("assets/images/lock.png"),
                    width: 100,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Text(
                    "Đặt lại mật khẩu",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: "Mật khẩu",
                      errorText: _invalidPassword ? _passwordError : null,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: TextField(
                    controller: _confirmPassController,
                    obscureText: true,
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: "Mật khẩu xác nhận",
                      errorText:
                          _invalidPassConfirm ? _passwordConfirmError : null,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: RaisedButton(
                      color: primaryLightColor,
                      onPressed: clickToResetPassword,
                      child: Text(
                        "Xác nhận",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6))),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void clickToResetPassword() {
    setState(() {
      String password = _passwordController.text;
      String passwordConfirm = _confirmPassController.text;

      if (password.length < 6 || password.length > 12) {
        _invalidPassword = true;
      } else {
        _invalidPassword = false;
      }

      if (passwordConfirm != password) {
        _invalidPassConfirm = true;
      } else {
        _invalidPassConfirm = false;
      }
    });
    if (!_invalidPassConfirm && !_invalidPassword) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginForm()));
    }
  }
}
