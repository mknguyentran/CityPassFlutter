import 'package:city_pass/constants.dart';
import 'package:city_pass/shared/section_title.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AttractionCategory extends StatelessWidget {
  const AttractionCategory({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Container(
        padding: const EdgeInsets.fromLTRB(20,20,20,5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [kDefaultShadow],
        ),
        child: Column(
          children: [
            SectionTitle(title: "Bạn muốn đi đâu?", titleColor: primaryLightColor),
            VerticalSpacing(
              of: 30,
            ),
            Wrap(
              alignment: WrapAlignment.start,
              spacing: getProportionateScreenWidth(30),
              runSpacing: getProportionateScreenWidth(15),
              children: [
                AttractionCategoryButton(
                  name: "Nhà hàng",
                  color: Colors.orange,
                  icon: Icons.restaurant,
                ),
                AttractionCategoryButton(
                  name: "Công viên giải trí",
                  color: Colors.lightGreen,
                  icon: Icons.park,
                ),
                AttractionCategoryButton(
                  name: "Bảo tàng",
                  color: Colors.brown[300],
                  icon: Icons.museum,
                ),
                AttractionCategoryButton(
                  name: "Cuộc sống về đêm",
                  color: Colors.deepOrange,
                  icon: Icons.nightlife,
                ),
                AttractionCategoryButton(
                  name: "Triển lãm",
                  color: Colors.purple[200],
                  icon: Icons.brush_rounded,
                ),
                AttractionCategoryButton(
                  name: "Biển",
                  color: Colors.teal[400],
                  icon: Icons.beach_access,
                ),
                AttractionCategoryButton(
                  name: "Leo núi",
                  color: Colors.yellow[700],
                  icon: FontAwesomeIcons.mountain,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AttractionCategoryButton extends StatelessWidget {
  const AttractionCategoryButton({
    Key key,
    @required this.name,
    @required this.icon,
    @required this.color,
    this.tapCallback,
  }) : super(key: key);

  final String name;
  final IconData icon;
  final GestureTapCallback tapCallback;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapCallback,
      child: Container(
        width: 55,
        height: 70,
        child: Column(
          children: [
            FaIcon(
              icon,
              size: 30,
              color: color,
            ),
            VerticalSpacing(
              of: 10,
            ),
            Expanded(
              child: Text(
                name,
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
