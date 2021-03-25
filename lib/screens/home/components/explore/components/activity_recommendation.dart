import 'package:animations/animations.dart';
import 'package:city_pass/model/activity.dart';
import 'package:city_pass/models/ticketTypeDetail.dart';
import 'package:city_pass/screens/activity_detail/activity_detail.dart';
import 'package:city_pass/models/ticketType.dart';
import 'package:city_pass/service/ticketType_services.dart';
import 'package:city_pass/screens/home/components/explore/components/activity_recommendation_card.dart';
import 'package:city_pass/shared/section_title.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActivityRecommendation extends StatefulWidget {
  const ActivityRecommendation(
      {Key key,
      @required this.title,
      @required this.children,

      this.hasPadding = true})
      : super(key: key);

  final String title;
  final List<TicketType> children;

  final bool hasPadding;


 

  @override
  _ActivityRecommendationState createState() => _ActivityRecommendationState();
}

class _ActivityRecommendationState extends State<ActivityRecommendation> {

 
  @override
  Widget build(BuildContext context) {
    //List<Activity> _activityList = new List.from(children);
    List<TicketType> _activityList = new List.from(widget.children);
    _activityList.shuffle();
    return Column(
      children: [
        SectionTitle(
          title: widget.title,
          hasPadding: widget.hasPadding,
          showAllCallback: () {},
        ),
        VerticalSpacing(
          of: 20,
        ),
        SingleChildScrollView(
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.only(
                left: widget.hasPadding ? getProportionateScreenWidth(20) : 0),
            child: Row(
              children: [
                ...List.generate(
                  _activityList.length,
                  (index) => Padding(
                    padding: EdgeInsets.only(
                      right: getProportionateScreenWidth(20),
                    ),
                    child: OpenContainer(
                      closedBuilder: (context, action) =>
                          ActivityRecommendationCard(
                        activity: _activityList[index],
                      ),
                      openBuilder: (context, action) => ActivityDetail(
                        ticketTypeID: _activityList[index].id,
                       
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(20),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
