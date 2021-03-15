import 'package:city_pass/constants.dart';
import 'package:city_pass/models/user_pass.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/material.dart';

class UserPassCard extends StatelessWidget {
  const UserPassCard({
    Key key,
    @required this.pass,
    @required this.press,
  }) : super(key: key);

  final UserPass pass;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [kDefaultShadow],
        ),
        child: Stack(
          children: [
            AspectRatio(
              aspectRatio: 1.7,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(pass.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              bottom: getProportionateScreenWidth(0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 80,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    boxShadow: [kDefaultShadow],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            pass.name,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            "HẾT HẠN VÀO ${simpleDateFormat.format(pass.expiredAt)}".toUpperCase(),
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "ĐÃ SỬ DỤNG",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                color: Colors.white),
                          ),
                          Text(
                            "${pass.usedDestination}/${pass.totalDestination}",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            "ĐỊA ĐIỂM",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
