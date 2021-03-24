import 'package:city_pass/constants.dart';
import 'package:flutter/material.dart';

class OutDatedPass extends StatefulWidget {
  @override
  _OutDatedPassState createState() => _OutDatedPassState();
}

class _OutDatedPassState extends State<OutDatedPass> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            
            Card(
                child: Row(
              children: <Widget>[
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/dam_sen/dam_sen_3.jpg"),
                          fit: BoxFit.cover)),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Text("HCM-Vui chơi thỏa thích",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500)),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Text("250.000VNĐ",
                            style: TextStyle(
                                fontSize: 15, color: subtitleTextColor)),
                        SizedBox(width: 20),
                        Text("460.000VNĐ",
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
                          "Hết hạn",
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
