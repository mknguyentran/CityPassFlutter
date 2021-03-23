import 'package:city_pass/screens/home/components/account/login_register/forget_password.dart';
import 'package:city_pass/screens/home/components/account/login_register/register.dart';
import 'package:city_pass/screens/home/home_screen.dart';
import 'package:city_pass/services/auth.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../../../../constants.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import '../../../../../blocs/auth_bloc.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final AuthService _authService = new AuthService();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  bool _invalidEmail = false;
  bool _invalidPassword = false;
  var _passwordError = "Mật khẩu không hợp lệ";
  var _emailError = "Email không hợp lệ";
  @override
  void initState() {
    var authBloc = Provider.of<AuthBloc>(context, listen: false);
    authBloc.currentUserChange.listen((user) {
      if (user != null) {
        Navigator.push(
            context, CupertinoPageRoute(builder: (context) => HomeScreen()));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = Provider.of<AuthBloc>(context);
    var _loginButtonHeight = 50.0;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(context),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              primaryDarkColor,
              secondaryColor,
              Colors.yellow[600],
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      CupertinoIcons.tree,
                      size: 30,
                      color: Colors.white.withOpacity(0.4),
                    ),
                    Icon(
                      CupertinoIcons.airplane,
                      size: 60,
                      color: Colors.white.withOpacity(0.6),
                    ),
                    Icon(
                      CupertinoIcons.person_crop_circle_fill,
                      size: 110,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.wallet_travel_rounded,
                      size: 60,
                      color: Colors.white.withOpacity(0.6),
                    ),
                    Icon(
                      Icons.beach_access_rounded,
                      size: 30,
                      color: Colors.white.withOpacity(0.4),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  "Chào mừng bạn đến với CityPass!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: percentageOfScreenHeight(20)),
                child: Text(
                  "Đăng nhập để nhận nhiều ưu đãi hấp dẫn",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(bottom: 10),
              //   child: TextField(
              //     controller: _emailController,
              //     style: TextStyle(color: Colors.black, fontSize: 15),
              //     decoration: InputDecoration(
              //         prefixIcon: Container(
              //           width: 50,
              //           child: Icon(Icons.email),
              //         ),
              //         labelText: "Email",
              //         errorStyle: TextStyle(fontSize: 15),
              //         errorText: _invalidEmail ? _emailError : null,
              //         border: OutlineInputBorder(
              //             borderRadius: BorderRadius.all(Radius.circular(10)),
              //             borderSide:
              //                 BorderSide(width: 2, color: primaryDarkColor))),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(bottom: 10),
              //   child: TextField(
              //     obscureText: true,
              //     controller: _passwordController,
              //     style: TextStyle(color: Colors.black, fontSize: 15),
              //     decoration: InputDecoration(
              //         prefixIcon: Container(
              //           width: 50,
              //           child: Icon(Icons.lock),
              //         ),
              //         labelText: "Mật khẩu",
              //         errorText: _invalidPassword ? _passwordError : null,
              //         errorStyle: TextStyle(fontSize: 10),
              //         border: OutlineInputBorder(
              //             borderRadius: BorderRadius.all(Radius.circular(10)),
              //             borderSide:
              //                 BorderSide(width: 2, color: Colors.red))),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(bottom: 15),
              //   child: Container(
              //     alignment: Alignment.topRight,
              //     child: GestureDetector(
              //       onTap: clickToResetPassword,
              //       child: Text(
              //         "Quên mật khẩu?",
              //         style: TextStyle(color: lightGray, fontSize: 15),
              //       ),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(bottom: 15),
              //   child: SizedBox(
              //     width: double.infinity,
              //     height: 50,
              //     child: RaisedButton(
              //       color: primaryDarkColor,
              //       onPressed: clickToLogin,
              //       child: Text(
              //         "Đăng nhập",
              //         style: TextStyle(color: Colors.white, fontSize: 20),
              //       ),
              //       shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.all(Radius.circular(6))),
              //     ),
              //   ),
              // ),
              LoginButton(
                height: _loginButtonHeight,
                width: percentageOfScreenWidth(80),
                backgroundColor: Colors.white,
                imagePath: "assets/images/login_icons/google_icon.png",
                text: "Đăng nhập bằng Google",
                onClick: () => authBloc.loginGoogle(),
              ),
              VerticalSpacing(),
              LoginButton(
                height: _loginButtonHeight,
                width: percentageOfScreenWidth(80),
                backgroundColor: Colors.white,
                imagePath: "assets/images/login_icons/facebook_icon.png",
                text: "Đăng nhập bằng Facebook",
                onClick: () async {
                  await authBloc.loginFacebook();
                },
              ),
              // Padding(
              //   padding: const EdgeInsets.only(bottom: 15),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: <Widget>[
              //       Text(
              //         "Bạn là người dùng mới? ",
              //         style: TextStyle(color: lightGray, fontSize: 15),
              //       ),
              //       GestureDetector(
              //         onTap: clickToRegister,
              //         child: Text(
              //           " Đăng kí tại đây ",
              //           style:
              //               TextStyle(color: primaryLightColor, fontSize: 15),
              //         ),
              //       )
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      brightness: Brightness.dark,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          CupertinoIcons.chevron_back,
          size: 30,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  // Future<void> clickToLogin() {
  //   setState(() {
  //     String email = _emailController.text.toString();
  //     String password = _passwordController.text.toString();
  //     // if (!RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+.[a-zA-Z0-9-.]+$")
  //     //     .hasMatch(email)) {
  //     //   _invalidEmail = true;
  //     // } else {
  //     //   _invalidEmail = false;
  //     // }
  //     _invalidEmail = false;
  //     if (password.length < 6 || password.length > 12) {
  //       _invalidPassword = true;
  //     } else {
  //       _invalidPassword = false;
  //     }

  //     if (!_invalidPassword && !_invalidEmail) {
  //       //var user = _authService.singnInWithCredential();
  //       Navigator.push(
  //           context, CupertinoPageRoute(builder: (context) => HomeScreen()));
  //     }
  //   });
  // }

  // void clickToResetPassword() {
  //   Navigator.push(
  //       context, CupertinoPageRoute(builder: (context) => ForgetPassword()));
  // }

}

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key key,
    @required this.height,
    this.width = 100,
    this.onClick,
    @required this.imagePath,
    this.text,
    this.backgroundColor = Colors.white,
  }) : super(key: key);

  final double height, width;
  final Function onClick;
  final String imagePath, text;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(height / 2),
          color: backgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: height,
              width: height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                ),
              ),
            ),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                    color: subtitleTextColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: height,
              width: height,
            )
          ],
        ),
      ),
    );
  }
}
