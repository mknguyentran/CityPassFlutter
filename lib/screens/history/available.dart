import 'package:city_pass/constants.dart';
import 'package:flutter/material.dart';

class AvailablePass extends StatefulWidget {
  @override
  _AvailablePassState createState() => _AvailablePassState();
}

class _AvailablePassState extends State<AvailablePass> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Card(
                  child: Row(
                children: <Widget>[
                  Container(
                    height: 120,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/dalat.jpg"),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Text("Trải nghiệm Đà Lạt Mộng Mơ ",
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
                                  fontSize: 15, color: Colors.redAccent, fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.lineThrough)),
                        ],
                      )
                    ],
                  )
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
