import 'package:city_pass/constants.dart';
import 'package:city_pass/model/user_pass.dart';
import 'package:city_pass/models/passDetailInformation.dart';
import 'package:city_pass/models/user_pass_available_show.dart';
import 'package:city_pass/service/pass_services.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/material.dart';

class UserPassCard extends StatefulWidget {
  const UserPassCard({
    Key key,
    @required this.pass,
    @required this.press,
  }) : super(key: key);

  final AvailableUserPass pass;
  final GestureTapCallback press;

  @override
  _UserPassCardState createState() => _UserPassCardState();
}

class _UserPassCardState extends State<UserPassCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.press,
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
                    image: NetworkImage(widget.pass.passImageUrl),
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
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(12),
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    boxShadow: [kDefaultShadow],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.pass.passName,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              "HẾT HẠN VÀO ${simpleDateFormat.format(widget.pass.expiredDate)}"
                                  .toUpperCase(),
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Khả dụng".toUpperCase(),
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.right,
                            ),
                            // Text(
                            //   "${widget.pass.usedDestination}/${widget.pass.totalDestination}",
                            //   style: TextStyle(
                            //       fontSize: 20,
                            //       fontWeight: FontWeight.bold,
                            //       color: Colors.white),
                            // ),
                            // Text(
                            //   "ĐỊA ĐIỂM",
                            //   style: TextStyle(
                            //       fontSize: 12,
                            //       fontWeight: FontWeight.w300,
                            //       color: Colors.white),
                            // ),
                          ],
                        ),
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
