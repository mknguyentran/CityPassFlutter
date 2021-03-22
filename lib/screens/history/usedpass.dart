import 'package:city_pass/constants.dart';
import 'package:flutter/material.dart';

class UsedPass extends StatefulWidget {
  @override
  _UsedPassState createState() => _UsedPassState();
}

class _UsedPassState extends State<UsedPass> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Card(
                child: Row(
              children: <Widget>[
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              "assets/images/landmark_72/landmark72_4.jpg"),
                          fit: BoxFit.cover)),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Text("Thủ Đô Special Trip",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500)),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Text("600.000VNĐ",
                            style: TextStyle(
                                fontSize: 15, color: subtitleTextColor)),
                        SizedBox(width: 20),
                        Text("1.600.000VNĐ",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.redAccent,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.lineThrough)),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Text(
                          "Đã sử dụng",
                          style:
                              TextStyle(color: subtitleTextColor, fontSize: 15),
                        ),
                        SizedBox(width: 45),
                        RaisedButton(
                          onPressed: clickToBookAgain,
                          color: primaryDarkColor,
                          child: Text(
                            "Đặt lại",
                            style: TextStyle(color: Colors.white, fontSize: 17),
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
            SizedBox(
              height: 30,
            ),
            Card(
                child: Row(
              children: <Widget>[
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/banahill_2.jpg"),
                          fit: BoxFit.cover)),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Text("Thành phố bên Sông Hàn",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500)),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Text("780.000VNĐ",
                            style: TextStyle(
                                fontSize: 15, color: subtitleTextColor)),
                        SizedBox(width: 20),
                        Text("1.200.000VNĐ",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.redAccent,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.lineThrough)),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Text(
                          "Đã sử dụng",
                          style:
                              TextStyle(color: subtitleTextColor, fontSize: 15),
                        ),
                        SizedBox(width: 45),
                        RaisedButton(
                          onPressed: clickToBookAgain,
                          color: primaryDarkColor,
                          child: Text(
                            "Đặt lại",
                            style: TextStyle(color: Colors.white, fontSize: 17),
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
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  void clickToBookAgain() {
    setState(() {
      //  Navigator.push(context, MaterialPageRoute(builder: (context) => ));
    });
  }
}
