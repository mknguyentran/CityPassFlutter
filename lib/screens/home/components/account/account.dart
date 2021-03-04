import 'package:city_pass/constants.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: 30),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(
                    CupertinoIcons.person_circle_fill,
                    size: 75,
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ngô Trường An",
                        style: TextStyle(
                            fontSize: 20,
                            color: primaryDarkColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Chỉnh sửa thông tin",
                        style:
                            TextStyle(fontSize: 16, color: primaryLightColor),
                      ),
                    ],
                  ),
                )
              ],
            ),
            VerticalSpacing(of: 10),
            Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [kDefaultShadow],
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    ListTile(
                      dense: true,
                      leading: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      title: Text("Danh sách yêu thích"),
                    ),
                    Divider(thickness: 1),
                    ListTile(
                      dense: true,
                      leading: Icon(
                        Icons.history,
                        color: Colors.yellow.shade700,
                      ),
                      title: Text("Lịch sử giao dịch"),
                    ),
                    Divider(thickness: 1),
                    ListTile(
                      dense: true,
                      leading: Icon(
                        CupertinoIcons.creditcard_fill,
                        color: primaryDarkColor,
                      ),
                      title: Text("Phương thức thanh toán"),
                    ),
                    Divider(thickness: 1),
                    ListTile(
                      dense: true,
                      leading: Icon(
                        CupertinoIcons.text_bubble_fill,
                        color: Colors.orange,
                      ),
                      title: Text("Lịch sử đánh giá"),
                    ),
                  ],
                )),
            VerticalSpacing(of: 20),
            Container(
                decoration: BoxDecoration(
                    color: Colors.white, boxShadow: [kDefaultShadow]),
                child: Column(
                  children: [
                    ListTile(
                      dense: true,
                      leading: Icon(
                        Icons.mail,
                        color: Colors.yellow.shade700,
                      ),
                      title: Text("Gửi phản hồi"),
                    ),
                    Divider(thickness: 1),
                    ListTile(
                      dense: true,
                      leading: Icon(
                        Icons.people,
                        color: primaryDarkColor,
                      ),
                      title: Text("Về CityPass"),
                    ),
                  ],
                )),
            VerticalSpacing(of: 50),
            Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(3, 3),
                        blurRadius: 10,
                        color: Color(0xFFE5B4AA).withOpacity(0.3),
                      )
                    ],
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Đổi tài khoản",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }
}
