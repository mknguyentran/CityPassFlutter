import 'package:city_pass/constants.dart';
import 'package:city_pass/models/category.dart';
import 'package:city_pass/models/city.dart';
import 'package:city_pass/models/ticketType.dart';
import 'package:city_pass/screens/activity_category/components/activity_category_header.dart';
import 'package:city_pass/screens/home/components/explore/components/activity_recommendation_vertical.dart';
import 'package:city_pass/service/ticketType_services.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActivityCategoryScreen extends StatefulWidget {
  final ActivityCategory category;
  final Color color;
  final IconData icon;
  final City city;

  const ActivityCategoryScreen({
    Key key,
    @required this.category,
    @required this.color,
    @required this.icon,
    @required this.city,
  }) : super(key: key);

  @override
  _ActivityCategoryScreenState createState() => _ActivityCategoryScreenState();
}

class _ActivityCategoryScreenState extends State<ActivityCategoryScreen> {
  Future<List<TicketType>> listTicketType;

  @override
  void initState() {
    super.initState();
    listTicketType = TicketTypeAPI()
        .getAllTicketTypes(cateId: widget.category.id.toString(), city: widget.city);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context, widget.color),
      backgroundColor: darkGrayBackground,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ActivityCategoryHeader(
              category: widget.category,
              color: widget.color,
              iconData: widget.icon,
            ),
            FutureBuilder(
              future: listTicketType,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 60),
                    child:
                        ActivityRecommendationVertical(children: snapshot.data),
                  );
                }
                return Container(
                  height: percentageOfScreenHeight(40),
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(widget.color),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context, Color color) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      brightness: Brightness.light,
      leading: IconButton(
        color: color,
        icon: Container(
          width: 30,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Icon(
            CupertinoIcons.chevron_left_circle_fill,
            size: 35,
          ),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
