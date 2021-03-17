import 'package:city_pass/constants.dart';
import 'package:flutter/material.dart';

class AvailablePass extends StatefulWidget {
  @override
  _AvailablePassState createState() => _AvailablePassState();
}

class _AvailablePassState extends State<AvailablePass> {
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
                          image: AssetImage("assets/images/sg_phon_hoa.jpg"),
                          fit: BoxFit.cover)),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Text("Sài Gòn-Thành phố phồn hoa",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500)),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Text("450.000VNĐ",
                            style: TextStyle(
                                fontSize: 15, color: subtitleTextColor)),
                        SizedBox(width: 20),
                        Text("500.000VNĐ",
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
                          "Còn hiệu lực",
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
                          image: AssetImage(
                              "assets/images/suoi_khoang_than_tai/sktt_3.jpg"),
                          fit: BoxFit.cover)),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Text("Khám phá Cầu Bàn Tay",
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
                        Text("1.300.000VNĐ",
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
                          "Còn hiệu lực",
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
                          image: AssetImage(
                              "assets/images/asiaWorld/asiaWorld_3.jpg"),
                          fit: BoxFit.cover)),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Text("Thành phố Biển Đà Nẵng",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500)),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Text("1.200.000VNĐ",
                            style: TextStyle(
                                fontSize: 15, color: subtitleTextColor)),
                        SizedBox(width: 20),
                        Text("2.000.000VNĐ",
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
                          "Còn hiệu lực",
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
