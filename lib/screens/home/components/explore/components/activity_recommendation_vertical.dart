import 'package:animations/animations.dart';
import 'package:city_pass/constants.dart';
import 'package:city_pass/model/activity.dart';
import 'package:city_pass/screens/activity_detail/activity_detail.dart';
import 'package:city_pass/models/ticketType.dart';
import 'package:city_pass/screens/home/components/explore/components/activity_recommendation_card_vertical.dart';
import 'package:city_pass/shared/section_title.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_guid/flutter_guid.dart';

class ActivityRecommendationVertical extends StatelessWidget {
  const ActivityRecommendationVertical({
    Key key,
    this.title,
    @required this.children,
    this.hasPadding = true,
    this.showAllCallback,
    }) : super(key: key);

  final String title;
  final List<TicketType> children;
  final bool hasPadding;
  final void Function() showAllCallback;

  @override
  Widget build(BuildContext context) {
    
    // children.sort((a, b) {
    //   if (a.travelDistance != null && b.travelDistance != null) {
    //     return (a.travelDistance - b.travelDistance).toInt();
    //   } else if (a.travelDistance == null && b.travelDistance == null) {
    //     return 0;
    //   } else {
    //     return a.travelDistance != null
    //         ? a.travelDistance.toInt()
    //         : b.travelDistance.toInt();
    //   }
    // });
    return Column(
      children: [
        if (title != null)
          SectionTitle(
            title: title,
            hasPadding: hasPadding,
            showAllCallback: showAllCallback,
          ),
        VerticalSpacing(
          of: 20,
        ),
        SingleChildScrollView(
          clipBehavior: Clip.none,
          child: Column(
            children: [
              ...List.generate(
                children.length,
                (index) => Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: hasPadding ? kDefaultPadding : 0),
                  child: OpenContainer(
                    closedElevation: 0,
                    closedShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0)),
                    closedBuilder: (context, action) =>
                        ActivityRecommendationCardVertical(
                      activity: children[index],
                    ),
                    openBuilder: (context, action) => ActivityDetail(
                      ticketTypeID: children[index].id,
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
      ],
    );
  }
}
