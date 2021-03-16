import 'package:city_pass/constants.dart';
import 'package:city_pass/models/category.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/material.dart';

class ActivityCategoryHeader extends StatelessWidget {
  const ActivityCategoryHeader({
    Key key,
    @required this.category,
  }) : super(key: key);

  final ActivityCategory category;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          height: getProportionateScreenHeight(250),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(category.imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: -50,
          child: Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 10, vertical: 10),
            height: 100,
            width: percentageOfScreenWidth(100) - kDefaultPadding * 2,
            decoration: BoxDecoration(
              color: category.themeColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [kPopShadow],
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Icon(
                    category.icon,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        category.name,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      VerticalSpacing(of: 10),
                      Expanded(
                        child: Text(
                          category.description,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
