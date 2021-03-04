import 'package:city_pass/screens/home/components/account/login_register/reset_password.dart';
import 'package:flutter/material.dart';
import '../../../../../constants.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController _emailController = new TextEditingController();
  bool _invalidEmail = false;
  var _emailError = "Email không hợp lệ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints.expand(),
        color: Colors.white,
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
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Quên mật khẩu ?",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 70),
                  child: Text(
                    "Vui lòng nhập email để CityPass giúp bạn",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 17,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: TextField(
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.mail),
                      labelText: "Email",
                      errorText: _invalidEmail ? _emailError : null,
                      errorStyle: TextStyle(fontSize: 15, color: Colors.red)
                    ),
                    controller: _emailController,
                    
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: RaisedButton(
                      color: primaryLightColor,
                      onPressed: clickToResetPassword,
                      child: Text(
                        "Đặt lại mật khẩu",
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
      String email = _emailController.text;
       if (!RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+.[a-zA-Z0-9-.]+$")
          .hasMatch(email)) {
        _invalidEmail = true;
      } else {
        _invalidEmail = false;
      }

      if(!_invalidEmail){
          Navigator.push(
        context, MaterialPageRoute(builder: (context) => ResetPassword()));
  
      }
    });
  
}
}