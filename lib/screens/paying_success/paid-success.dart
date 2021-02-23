import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class PayingSuccessScreen extends StatefulWidget {
  @override
  _PayingSuccessScreenState createState() => _PayingSuccessScreenState();
}

class _PayingSuccessScreenState extends State<PayingSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: <Widget>[

            Container(           
            width: 400,
            height: 250,
            color: Colors.white,
            child: Center(
              child: Column(
                children: <Widget>[
                  
                 Container(
                   margin: EdgeInsets.only(top: 70),
                   child: Text("V", style: TextStyle(color: Colors.white, fontSize: 47),),
                   width: 70,
                   height: 70,
                   decoration: BoxDecoration(
                     shape: BoxShape.circle,
                     color: Colors.green,
                   ),
                  alignment: AlignmentDirectional.center,
                 ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Text("Thanh toán thành công", style: TextStyle(fontSize: 30, color: Colors.black ),),
                  alignment: AlignmentDirectional.center,
                )],
              ),
            ),
          ),

          Container(
            width: 400,
            height: 50,
            
            margin: EdgeInsets.only(top: 5),
            padding: EdgeInsets.only(top: 15),
           color: Colors.white,
            child: Text("Tóm tắt đơn hàng", style: TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),),
          ),

          Container(
            width: 400,
            height: 100,
           
            margin: EdgeInsets.only(top: 5),
           color: Colors.white,
            child: Column(
              children: <Widget> [
                Container(
                  child: Stack(children: [
                    Container(
                      child: Text("2x", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold,) ,
                    
                      ),
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 30),
                      ),
                    Container(margin: EdgeInsets.fromLTRB(30, 15, 0, 30), child: Text("[Tên Pass] - Người lớn", style: TextStyle(color: Colors.black, fontSize: 15),)),
                    Container(margin: EdgeInsets.fromLTRB(300, 15, 0, 30), child: Text("500.000", style: TextStyle(color: Colors.black, fontSize: 15),))
                  ],),
                ),
                 Container(
                  child: Stack(children: [
                    Container(
                      child: Text("3x", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold,) ,
                      ),   
                      ),
                    Container(margin: EdgeInsets.fromLTRB(30, 0, 0, 5), child: Text("[Tên Pass] - Trẻ em", style: TextStyle(color: Colors.black, fontSize: 15),)),
                    Container(margin: EdgeInsets.fromLTRB(300, 0, 0, 5), child: Text("500.000", style: TextStyle(color: Colors.black, fontSize: 15),))
                  ],),
                )
              ],),
          ),

          Container(
            width: 400,
            height: 100,
            margin: EdgeInsets.only(top: 10),
           
            color: Colors.white,
            child: Column(children: [
                Container(
                  child: Stack(children: [
                    Container(margin: EdgeInsets.fromLTRB(0, 15, 0, 0), child: Text("Phương thức thanh toán", style: TextStyle(color: Colors.black, fontSize: 15),)),
                    Container(margin: EdgeInsets.fromLTRB(300, 15, 0, 0), child: Text("PayPal", style: TextStyle(color: Colors.black, fontSize: 15),))
                  ],),
                ),
                Container(
                  child: Stack(children: [
                    Container(margin: EdgeInsets.fromLTRB(0, 15, 0, 5), child: Text("Tổng cộng", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),)),
                    Container(margin: EdgeInsets.fromLTRB(280, 15, 0, 5), child: Text("1.000.000", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),))
                  ],),
                ),
            ],),
          ),

          Container(
            width: 350,
            height: 40,
            margin: EdgeInsets.only(top: 20),
           
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: Colors.green),
            alignment: AlignmentDirectional.center,
            child: Text("Xem CityPass của tôi", style: TextStyle(color: Colors.white, fontSize: 20),),
          )
          ],
          
        ),


      ),
    );
  }
}

