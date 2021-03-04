import 'package:city_pass/screens/home/components/account/login_register/login.dart';
import 'package:city_pass/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import '../../../../../constants.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  DateTime _selectedDate = DateTime.now();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _passwordConfirmController =
      new TextEditingController();
  

  bool _invalidEmail = false;
  bool _invalidPassword = false;
  bool _invalidName = false;
  bool _invalidPassConfirm = false;
  bool _acceptChecked = false;
  bool _invalidBirthday = false;

  var _passwordError = "Mật khẩu phải từ 6 tới 12 kí tự";
  var _emailError = "Email không hợp lệ";
  var _nameError = "Tên phải từ 3 kí tự";
  var _passwordConfirmError = "Mật khẩu xác nhận không hợp lệ";
  var _birthdayError = "Bạn phải đủ 18 tuổi để sử dụng CityPass";

  var _birthdayString = "Chọn ngày sinh";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            constraints: BoxConstraints.expand(),
            color: Colors.white,
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                    kDefaultPadding, 0, kDefaultPadding, 0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
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
                          "Đăng kí để trở thành thành viên của chúng tôi",
                          style:
                              TextStyle(color: primaryLightColor, fontSize: 15),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: TextField(
                          controller: _nameController,
                          style: TextStyle(color: Colors.black, fontSize: 15),
                          decoration: InputDecoration(
                              prefixIcon: Container(
                                width: 50,
                                child: Icon(Icons.account_circle),
                              ),
                              labelText: "Tên",
                              errorStyle: TextStyle(fontSize: 12),
                              errorText: _invalidName ? _nameError : null,
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                      width: 2, color: primaryDarkColor))),
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
                              errorStyle: TextStyle(fontSize: 12),
                              errorText: _invalidEmail ? _emailError : null,
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                      width: 2, color: primaryDarkColor))),
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
                              errorStyle: TextStyle(fontSize: 12),
                              errorText:
                                  _invalidPassword ? _passwordError : null,
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                      width: 2, color: primaryDarkColor))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: TextField(
                          obscureText: true,
                          controller: _passwordConfirmController,
                          style: TextStyle(color: Colors.black, fontSize: 15),
                          decoration: InputDecoration(
                              prefixIcon: Container(
                                width: 50,
                                child: Icon(Icons.lock),
                              ),
                              labelText: "Mật khẩu xác nhận",
                              errorStyle: TextStyle(fontSize: 12),
                              errorText: _invalidPassConfirm
                                  ? _passwordConfirmError
                                  : null,
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                      width: 2, color: primaryDarkColor))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: SizedBox(
                          width: double.infinity,
                          child: Row(
                            children: [
                              Icon(
                                Icons.cake,
                                color: Colors.grey,
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                width: 260,
                                child: RaisedButton(
                                  onPressed: () {
                                    _selectDate(context);
                                  },
                                  child: Text(_birthdayString),
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),

                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          _invalidBirthday ? _birthdayError : "",
                          style: TextStyle(fontSize: 12, color: Colors.red),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: SizedBox(
                                width: 20,
                                height: 20,
                                child: Checkbox(
                                    value: _acceptChecked,
                                    onChanged: (value) {
                                      setState(() {
                                        _acceptChecked = value;
                                      });
                                    }),
                              ),
                            ),
                            Text(
                              'Tôi hoàn toàn đồng ý với các điều khoản của CityPass',
                              style: TextStyle(color: lightGray, fontSize: 12),
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: RaisedButton(
                            color: primaryDarkColor,
                            onPressed: clickToRegister,
                            child: Text(
                              "Đăng kí thành viên",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6))),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Bạn đã có tài khoản? ",
                              style: TextStyle(color: lightGray, fontSize: 12),
                            ),
                            GestureDetector(
                              onTap: clickToLogin,
                              child: Text(
                                " Đăng nhập tại đây ",
                                style: TextStyle(
                                    color: primaryLightColor, fontSize: 12),
                              ),
                            )
                          ],
                        ),
                      ),
                    ]),
              ),
            )));
  }

  void clickToRegister() {
    setState(() {
      String name = _nameController.text;
      String email = _emailController.text;
      String password = _passwordController.text;
      String passwordConfirm = _passwordConfirmController.text;
      // name
      if (name.length < 3 || name.length > 30) {
        _invalidName = true;
      } else {
        _invalidName = false;
      }
      //email
      if (!RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+.[a-zA-Z0-9-.]+$")
          .hasMatch(email)) {
        _invalidEmail = true;
      } else {
        _invalidEmail = false;
      }
      //password
      if (password.length < 6 || password.length > 12) {
        _invalidPassword = true;
      } else {
        _invalidPassword = false;
      }
      //password confirm
      if (passwordConfirm != password) {
        _invalidPassConfirm = true;
      } else {
        _invalidPassConfirm = false;
      }

      int differenceDate = calculateDifference(_selectedDate);
      if (differenceDate > 0) {
        _invalidBirthday = true;
      } else {
        _invalidBirthday = false;
      }

      if (!_invalidName &&
          !_invalidPassword &&
          !_invalidPassConfirm &&
          !_invalidEmail &&
          _acceptChecked) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    });
  }

  void clickToLogin() {
    setState(() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginForm()));
    });
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(1900, 1),
        lastDate: DateTime(2021, 6));
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
        _birthdayString = "${_selectedDate.toLocal()}".split(' ')[0];
      });
  }

  int calculateDifference(DateTime date) {
    DateTime now = DateTime.now();
    DateTime comparedTime = DateTime(now.year - 18, now.month, now.day);
    return DateTime(date.year, date.month, date.day)
        .difference(
            DateTime(comparedTime.year, comparedTime.month, comparedTime.day))
        .inDays;
  }
}
