import 'package:city_pass/screens/home/components/account/login_register/forget_password.dart';
import 'package:city_pass/screens/home/components/account/login_register/register.dart';
import 'package:city_pass/screens/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  bool _invalidEmail = false;
  bool _invalidPassword = false;
  var _passwordError = "Mật khẩu không hợp lệ";
  var _emailError = "Email không hợp lệ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
                kDefaultPadding, 50, kDefaultPadding, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Container(
                    child: Image.asset("assets/images/user.png"),
                    width: 100,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    "Chào mừng bạn đến với CityPass!",
                    style: TextStyle(
                        color: primaryDarkColor,
                        fontSize: 21,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Text(
                    "Đăng nhập để nhận nhiều ưu đãi hấp dẫn",
                    style: TextStyle(color: primaryLightColor, fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: TextField(
                    controller: _emailController,
                    style: TextStyle(color: Colors.black, fontSize: 15),
                    decoration: InputDecoration(
                        prefixIcon: Container(
                          width: 50,
                          child: Icon(Icons.email),
                        ),
                        labelText: "Email",
                        errorStyle: TextStyle(fontSize: 15),
                        errorText: _invalidEmail ? _emailError : null,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(width: 2, color: primaryDarkColor))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: TextField(
                    obscureText: true,
                    controller: _passwordController,
                    style: TextStyle(color: Colors.black, fontSize: 15),
                    decoration: InputDecoration(
                        prefixIcon: Container(
                          width: 50,
                          child: Icon(Icons.lock),
                        ),
                        labelText: "Mật khẩu",
                        errorText: _invalidPassword ? _passwordError : null,
                        errorStyle: TextStyle(fontSize: 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(width: 2, color: Colors.red))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Container(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: clickToResetPassword,
                      child: Text(
                        "Quên mật khẩu?",
                        style: TextStyle(color: lightGray, fontSize: 15),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: RaisedButton(
                      color: primaryDarkColor,
                      onPressed: clickToLogin,
                      child: Text(
                        "Đăng nhập",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: GestureDetector(
                    onTap: clickToLoginByFacebook,
                    child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1, color: Colors.green),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 5, 0),
                              child: CircleAvatar(
                                foregroundColor: primaryLightColor,
                                radius: 20.0,
                                backgroundImage:
                                    AssetImage("assets/images/facebook.png"),
                              ),
                            ),
                            Text(
                              " Đăng nhập với Facebook",
                              style:
                                  TextStyle(color: Colors.green, fontSize: 20),
                            )
                          ],
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: GestureDetector(
                    onTap: clickToLoginByGoogle,
                    child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1, color: Colors.green),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 5, 0),
                              child: CircleAvatar(
                                foregroundColor: primaryLightColor,
                                radius: 20.0,
                                backgroundImage:
                                    AssetImage("assets/images/google.png"),
                              ),
                            ),
                            Text(
                              " Đăng nhập với Google",
                              style:
                                  TextStyle(color: Colors.green, fontSize: 20),
                            )
                          ],
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Bạn là người dùng mới? ",
                        style: TextStyle(color: lightGray, fontSize: 15),
                      ),
                      GestureDetector(
                        onTap: clickToRegister,
                        child: Text(
                          " Đăng kí tại đây ",
                          style:
                              TextStyle(color: primaryLightColor, fontSize: 15),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void clickToLogin() {
    setState(() {
      String email = _emailController.text.toString();
      String password = _passwordController.text.toString();
      if (!RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+.[a-zA-Z0-9-.]+$")
          .hasMatch(email)) {
        _invalidEmail = true;
      } else {
        _invalidEmail = false;
      }

      if (password.length < 6 || password.length > 12) {
        _invalidPassword = true;
      } else {
        _invalidPassword = false;
      }

      if (!_invalidPassword && !_invalidEmail) {
        Navigator.push(
            context, CupertinoPageRoute(builder: (context) => HomeScreen()));
      }
    });
  }

  void clickToResetPassword() {
    Navigator.push(
        context, CupertinoPageRoute(builder: (context) => ForgetPassword()));
  }

  void clickToLoginByFacebook() {
    Navigator.push(
        context, CupertinoPageRoute(builder: (context) => HomeScreen()));
  }

  void clickToLoginByGoogle() {
    Navigator.push(
        context, CupertinoPageRoute(builder: (context) => HomeScreen()));
  }

  void clickToRegister() {
    Navigator.push(
        context, CupertinoPageRoute(builder: (context) => RegisterForm()));
  }
}
