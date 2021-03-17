import 'package:city_pass/constants.dart';
import 'package:city_pass/models/activity.dart';
import 'package:city_pass/screens/activity_detail/activity_detail.dart';
import 'package:city_pass/service/ticketType.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AvailableDestinations extends StatelessWidget {
  //final List<Activity> destinationList;
  final List<TicketType> destinationList;

  const AvailableDestinations({Key key, @required this.destinationList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _currentIndex = 1;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDestinationList(
           itemList: destinationList,
            context: context,
            currentIndex: _currentIndex,
          ),
        ],
      ),
    );
  }
}

Column _buildDestinationList({
  //@required List<Activity> itemList,
  @required List<TicketType> itemList,
  @required int currentIndex,
  @required BuildContext context,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ...List.generate(
        itemList.length,
        (index) => _buildDestinationListItem(
          activity: itemList[index],
          context: context,
          index: currentIndex++,
        ),
      )
    ],
  );
}

Widget _buildDestinationListItem(
    {int index,
    double lineSpacing = 7.0,
    //@required Activity activity,
    @required TicketType activity,
    @required BuildContext context}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: lineSpacing),
    child: Row(
      children: [
        Container(
          margin: EdgeInsets.only(right: 10),
          alignment: Alignment.center,
          width: getProportionateScreenWidth(25),
          height: getProportionateScreenWidth(25),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: dividerColor,
          ),
          child: Text(
            (index != null) ? index.toString() : "",
            style: TextStyle(
              color: primaryLightColor,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
        _buildItemName(activity, context)
      ],
    ),
  );
}

Widget _buildItemName(TicketType activity, BuildContext context) {
  return Expanded(
    child: GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(builder: (context) {
            return ActivityDetail(
              activity: activity,
            );
          }),
        );
      },
      child: Text(
        activity.name.toUpperCase(),
        style: TextStyle(fontSize: 14),
      ),
    ),
  );
}
