import 'package:city_pass/blocs/auth_bloc.dart';
import 'package:city_pass/constants.dart';
import 'package:city_pass/models/pass.dart';
import 'package:city_pass/screens/home/components/account/login_register/login.dart';
import 'package:city_pass/screens/pass_detail/components/pass_detail_content.dart';
import 'package:city_pass/screens/pass_detail/components/pass_detail_header.dart';
import 'package:city_pass/screens/pass_detail/components/pass_detail_price_bar.dart';
import 'package:city_pass/service/pass_services.dart';
import 'package:city_pass/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_guid/flutter_guid.dart';
import 'package:city_pass/models/passDetailInformation.dart';
import 'package:provider/provider.dart';
import 'components/choose_pass_amount.dart';

class PassDetail extends StatefulWidget {
  final Guid passId;

  const PassDetail({Key key, @required this.passId}) : super(key: key);

  @override
  _PassDetailState createState() => _PassDetailState();
}

class _PassDetailState extends State<PassDetail> {
  List _chosenList = [];
  var _user;
  Future<PassDetailInformation> passDetail;

  @override
  void initState() {
    super.initState();
    passDetail = PassAPI().getPassByID(
      onError: (msg) {
        print(msg);
      },
      id: widget.passId.toString(),
    );
  }

  void _onOptionChose() {
    setState(() {});
  }

  void _loadUser() {
    final authBloc = Provider.of<AuthBloc>(context, listen: false);
    setState(() {
      _user = authBloc.currentUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    _loadUser();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: FutureBuilder(
            future: passDetail,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    PassDetailHeader(passDetail: snapshot.data),
                    PassDetailPriceBar(passDetail: snapshot.data),
                    Divider(
                      color: dividerColor,
                      thickness: 10,
                      height: 20,
                    ),
                    PassDetailContent(
                      passDetail: snapshot.data,
                      chosenList: _chosenList,
                      onOptionChose: _onOptionChose,
                    ),
                  ],
                );
              }
              return Container(
                height: percentageOfScreenHeight(100),
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              );
            }),
      ),
      bottomNavigationBar: FutureBuilder(
        future: passDetail,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return BottomAppBar(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                    kDefaultPadding, 10, kDefaultPadding, 10),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  child: _buildBuyButton(
                    context,
                    _chosenList.length ==
                        (snapshot.data as PassDetailInformation)
                            .totalOptionalAmount,
                    _chosenList,
                    _user,
                  ),
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  ElevatedButton _buildBuyButton(BuildContext context, bool finishedChoosing,
      List<dynamic> chosenList, User user) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: user == null
            ? MaterialStateProperty.all(primaryDarkColor)
            : finishedChoosing
                ? MaterialStateProperty.all(primaryLightColor)
                : MaterialStateProperty.all(fadedTextColor),
        textStyle: MaterialStateProperty.all(
          TextStyle(
            fontFamily: "SFProRounded",
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      onPressed: user == null
          ? () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => LoginForm(),
                ),
              ).then((value) => _loadUser());
            }
          : finishedChoosing
              ? () {
                  showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return FutureBuilder(
                          future: passDetail,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ChoosePassAmount(
                                passDetail: snapshot.data,
                                chosenList: chosenList,
                              );
                            }
                            return Center(child: CircularProgressIndicator());
                          },
                        );
                      });
                }
              : null,
      child: Text(
        user == null
            ? "Bạn phải đăng nhập để mua"
            : finishedChoosing
                ? "Mua ngay"
                : "Chọn các địa điểm tùy chọn trước khi mua",
        style: TextStyle(fontSize: finishedChoosing ? 20 : 16),
        textAlign: TextAlign.center,
      ),
    );
  }
}

AppBar _buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.transparent,
    brightness: Brightness.dark,
    leading: IconButton(
      icon: Icon(
        Icons.chevron_left_rounded,
        size: 30,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    ),
    actions: [
      IconButton(
        icon: Icon(CupertinoIcons.home),
        onPressed: () {
          Navigator.of(context).popUntil((route) => route.isFirst);
        },
      )
    ],
  );
}
