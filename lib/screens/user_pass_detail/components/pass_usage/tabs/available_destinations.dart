import 'package:city_pass/constants.dart';
import 'package:city_pass/models/activity.dart';
import 'package:city_pass/models/pass.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/material.dart';

class AvailableDestinations extends StatelessWidget {
  final List<IncludingDestination> destinationList;

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
          ...List.generate(
            destinationList.length,
            (index) {
              Widget result;
              switch (destinationList[index].type) {
                case IncludingDestination.allIncluded:
                  result = _buildDestinationList(
                    itemList: destinationList[index].destinationList,
                    context: context,
                    currentIndex: _currentIndex,
                  );
                  _currentIndex +=
                      destinationList[index].destinationList.length;
                  break;
                case IncludingDestination.binaryOptional:
                  result = _buildDestinationListItem(
                      name: destinationList[index].destinationList[0].name,
                      secondName: destinationList[index].destinationList[1].name,
                      context: context,
                      index: _currentIndex++);
                  break;
                case IncludingDestination.optional:
                  result = _buildOptionalDestinationList(
                      itemList: destinationList[index].destinationList,
                      includingQuota: destinationList[index].includingQuota,
                      context: context);
                  break;
                default:
                  break;
              }
              return result;
            },
          ),
        ],
      ),
    );
  }
}

Column _buildOptionalDestinationList({
  @required List<Activity> itemList,
  @required int includingQuota,
  @required BuildContext context,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      OptionalDestinationListHeader(includingQuota: includingQuota),
      ...List.generate(
        itemList.length,
        (index) => _buildDestinationListItem(
          name: itemList[index].name,
          context: context,
        ),
      )
    ],
  );
}

Column _buildDestinationList({
  @required List<Activity> itemList,
  @required int currentIndex,
  @required BuildContext context,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ...List.generate(
        itemList.length,
        (index) => _buildDestinationListItem(
          name: itemList[index].name,
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
    @required String name,
    String secondName,
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
              color: primaryDarkColor,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
        _buildItemName(name, secondName, context)
      ],
    ),
  );
}

Widget _buildItemName(String name, String secondName, BuildContext context) {
  if (secondName != null) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: [
          TextSpan(text: name.toUpperCase() + " "),
          TextSpan(text: "HOẶC ", style: TextStyle(color: primaryLightColor)),
          TextSpan(text: secondName.toUpperCase()),
        ],
      ),
    );
  }
  return Text(
    name.toUpperCase(),
    style: TextStyle(fontSize: 14),
  );
}

class OptionalDestinationListHeader extends StatelessWidget {
  const OptionalDestinationListHeader({
    Key key,
    this.lineSpacing = 7.0,
    @required this.includingQuota,
  }) : super(key: key);

  final double lineSpacing;
  final int includingQuota;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: lineSpacing),
      child: RichText(
        text: TextSpan(
            style:
                DefaultTextStyle.of(context).style.apply(fontWeightDelta: -1),
            children: [
              TextSpan(text: "Cộng với "),
              TextSpan(
                text: "$includingQuota địa điểm ",
                style: DefaultTextStyle.of(context)
                    .style
                    .apply(fontSizeDelta: 2, fontWeightDelta: 2),
              ),
              TextSpan(text: "tuỳ chọn trong số các địa điểm sau:"),
            ]),
      ),
    );
  }
}
