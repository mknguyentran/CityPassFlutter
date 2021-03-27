import 'package:city_pass/constants.dart';
import 'package:city_pass/mockupData/mockup_category.dart';
import 'package:city_pass/models/category.dart';
import 'package:city_pass/screens/activity_category/activity_category.dart';
import 'package:city_pass/service/category_service.dart';
import 'package:city_pass/shared/section_title.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AttractionCategory extends StatefulWidget {
  const AttractionCategory({
    Key key,
  }) : super(key: key);

  @override
  _AttractionCategoryState createState() => _AttractionCategoryState();
}

class _AttractionCategoryState extends State<AttractionCategory> {
  Future<List<ActivityCategory>> cateList;
  List<Color> colorList = [
    Colors.brown,
    Colors.orange,
    Colors.teal[400],
    Colors.redAccent,
    Colors.lightGreen,
    Colors.amber
  ];
  List<IconData> iconList = [
    Icons.history_edu_rounded,
    FontAwesomeIcons.running,
    Icons.beach_access,
    Icons.museum,
    Icons.park,
    FontAwesomeIcons.swimmingPool
  ];
  @override
  void initState() {
    super.initState();
    cateList = CategoryAPI().getCategoryList((msg) {
      print(msg);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [kDefaultShadow],
        ),
        child: Column(
          children: [
            SectionTitle(
                title: "Bạn muốn đi đâu?", titleColor: primaryLightColor),
            VerticalSpacing(
              of: 30,
            ),
            FutureBuilder(
              future: cateList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Wrap(
                    alignment: WrapAlignment.start,
                    spacing: getProportionateScreenWidth(30),
                    runSpacing: getProportionateScreenWidth(15),
                    children: [
                      ...List.generate(
                        snapshot.data.length,
                        (index) => ActivityCategoryButton(
                          category: snapshot.data[index],
                          color: colorList[index],
                          iconData: iconList[index],
                          tapCallback: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) {
                                  return ActivityCategoryScreen(
                                    category: snapshot.data[index],
                                    color: colorList[index],
                                    icon: iconList[index],
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  );
                }
                return Center(
                    child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(primaryLightColor),
                ));
              },
            )
          ],
        ),
      ),
    );
  }
}

class ActivityCategoryButton extends StatefulWidget {
  const ActivityCategoryButton(
      {Key key,
      this.tapCallback,
      @required this.category,
      this.color,
      this.iconData})
      : super(key: key);

  final GestureTapCallback tapCallback;
  final ActivityCategory category;
  final Color color;
  final IconData iconData;

  @override
  _ActivityCategoryButtonState createState() => _ActivityCategoryButtonState();
}

class _ActivityCategoryButtonState extends State<ActivityCategoryButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.tapCallback,
      child: Container(
        width: 55,
        height: 70,
        child: Column(
          children: [
            FaIcon(
              widget.iconData,
              size: 30,
              color: widget.color,
            ),
            VerticalSpacing(
              of: 10,
            ),
            Expanded(
              child: Text(
                widget.category.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: kTextColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
