import 'package:city_pass/constants.dart';
import 'package:city_pass/models/pass.dart';
import 'package:city_pass/screens/pass_detail/components/pass_detail_content.dart';
import 'package:city_pass/screens/pass_detail/components/pass_detail_header.dart';
import 'package:city_pass/screens/pass_detail/components/pass_detail_price_bar.dart';
import 'package:city_pass/service/pass_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_guid/flutter_guid.dart';
import 'package:city_pass/models/passDetailInformation.dart';
import 'components/choose_pass_amount.dart';

class PassDetail extends StatefulWidget {
  final Guid passId;

  const PassDetail({Key key, @required this.passId}) : super(key: key);

  @override
  _PassDetailState createState() => _PassDetailState();
}

class _PassDetailState extends State<PassDetail> {
  List _chosenList = [];

  Future<PassDetailInformation> passDetail;

  

  @override
  void initState() {
    super.initState();
    passDetail = PassAPI().getPassByID(
        onError: (msg) {
          print(msg);
        },
        id: widget.passId.toString());
  }

  void _onOptionChose() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
              return CircularProgressIndicator();
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

  ElevatedButton _buildBuyButton(
      BuildContext context, bool finishedChoosing, List<dynamic> chosenList) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: finishedChoosing
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
      onPressed: finishedChoosing
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
                        return CircularProgressIndicator();
                      },
                    );
                  });
            }
          : null,
      child: Text(
        finishedChoosing
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
      IconButton(icon: Icon(Icons.favorite_border_rounded), onPressed: () {})
    ],
  );
}
