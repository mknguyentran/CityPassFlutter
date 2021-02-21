import 'package:city_pass/constants.dart';
import 'package:city_pass/models/activity.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/material.dart';

//Replace with activity data
String test = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";
String image = "assets/images/dinh_doc_lap.jpg";

class ActivityInfo extends StatelessWidget {
  final Activity activity;
  const ActivityInfo({
    Key key,
    @required this.activity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: Text(
                test, //Replace with activity description
                style: TextStyle(
                  height: 1.4),
              ),
            ),
          ),
          VerticalSpacing(
            of: 50
          ),
          SingleChildScrollView(
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.generate( //Replace with activity images
                  2,
                  (index) => Padding(
                    padding: index != 0 ? EdgeInsets.only(left: 20) : EdgeInsets.zero,
                    child: Image.asset(
                      image,
                      width: getProportionateScreenWidth(350),
                      fit: BoxFit.cover
                    ),
                  )
                )
              ],
            ),
          ),
          VerticalSpacing(
            of: 50
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Thời gian hoạt động",
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  VerticalSpacing(of: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Thứ hai")
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("09:00 - 11:30 và 11:30 - 19:00")
                        ],
                      ),
                    ],
                  ),
                  VerticalSpacing(of: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Thứ ba", style: TextStyle(color: primaryDarkColor),)
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("09:00 - 11:30 và 11:30 - 19:00", style: TextStyle(color: primaryDarkColor),)
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
