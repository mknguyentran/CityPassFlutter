import 'package:city_pass/constants.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(kDefaultPadding),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                CupertinoIcons.person_circle_fill,
                size: 75,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nguyễn Trần Minh Khoa",
                      style: TextStyle(
                        fontSize: 20,
                        color: primaryDarkColor
                      ),
                    ),
                    Text(
                      "Chỉnh sửa thông tin",
                      style: TextStyle(
                        fontSize: 16,
                        color: primaryLightColor
                      ),
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
              boxShadow: [kDefaultShadow]
            ),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                  title: Text("Danh sách yêu thích"),
                ),
                Divider(thickness: 1),
                ListTile(
                  leading: Icon(
                    Icons.history,
                    color: Colors.yellow.shade700,
                  ),
                  title: Text("Lịch sử giao dịch"),
                ),
                Divider(thickness: 1),
                ListTile(
                  leading: Icon(
                    Icons.credit_card,
                    color: primaryDarkColor,
                  ),
                  title: Text("Phương thức thanh toán"),
                ),
                Divider(thickness: 1),
                ListTile(
                  leading: Icon(
                    Icons.chat,
                    color: Colors.orange,
                  ),
                  title: Text("Lịch sử đánh giá"),
                ),
              ],
            )
          ),
          VerticalSpacing(of: 20),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [kDefaultShadow]
            ),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.mail,
                    color: Colors.yellow.shade700,
                  ),
                  title: Text("Gửi phản hồi"),
                ),
                Divider(thickness: 1),
                ListTile(
                  leading: Icon(
                    Icons.people,
                    color: primaryDarkColor,
                  ),
                  title: Text("Về CityPass"),
                ),
              ],
            )
          ),
          VerticalSpacing(of: 50),
          Container(
            height: getProportionateScreenHeight(50),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [kDefaultShadow]
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Đổi tài khoản",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20
                  ),
                )
              ],
            )
          )
        ],
      )
    );
  }
}
