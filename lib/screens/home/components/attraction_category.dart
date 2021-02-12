import 'package:city_pass/constants.dart';
import 'package:city_pass/shared/section_title.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/material.dart';

class AttractionCategory extends StatelessWidget {
  const AttractionCategory({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(title: "Bạn muốn đi đâu?", showAllCallback: null, hasPadding: true,),
        VerticalSpacing(
          of: 20,
        ),
        Wrap(
          alignment: WrapAlignment.start,
          spacing: getProportionateScreenWidth(10),
          runSpacing: getProportionateScreenWidth(20),
          children: [
            AttractionCategoryButton(
              name: "Nhà hàng",
              color: Colors.orange,
              icon: Icons.restaurant,
            ),
            AttractionCategoryButton(
              name: "Công viên giải trí",
              color: Colors.green,
              icon: Icons.park,
            ),
            AttractionCategoryButton(
              name: "Bảo tàng",
              color: Colors.brown,
              icon: Icons.museum,
            ),
            AttractionCategoryButton(
              name: "Cuộc sống về đêm",
              color: Colors.blueGrey,
              icon: Icons.nightlife,
            ),
            AttractionCategoryButton(
                name: "Triển lãm",
                color: Colors.deepPurple,
                icon: Icons.brush_rounded),
          ],
        ),
        VerticalSpacing(
          of: 20,
        )
      ],
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
        padding: EdgeInsets.all(7),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [kDefaultShadow],
        ),
        height: getProportionateScreenWidth(80),
        width: getProportionateScreenWidth(120),
        child: Column(
          children: [
            Icon(
              icon,
              size: 35,
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
