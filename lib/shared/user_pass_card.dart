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
  Future<PassDetailInformation> passDetail;
  @override
  void initState() {
    super.initState();
    print(widget.pass.passID);
    passDetail =
        PassAPI().getPassByID(onError: (msg) {}, id: widget.pass.passID);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.press,
      child: Container(
          decoration: BoxDecoration(
            boxShadow: [kDefaultShadow],
          ),
          child: FutureBuilder(
            future: passDetail,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                PassDetailInformation detail =  snapshot.data;
                return Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 1.7,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(''),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    detail.name,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "ĐANG SỬ DỤNG",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white),
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
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                );
              }
              return CircularProgressIndicator();
            },
          )),
    );
  }
}
