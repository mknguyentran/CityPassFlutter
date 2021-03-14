import 'package:city_pass/constants.dart';
import 'package:city_pass/models/activity.dart';
import 'package:city_pass/models/pass.dart';
import 'package:city_pass/shared/section_title.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/material.dart';

class PassDetailContent extends StatelessWidget {
  const PassDetailContent({
    Key key,
    @required this.pass,
  }) : super(key: key);

  final Pass pass;

  @override
  Widget build(BuildContext context) {
    int _currentIndex = 1;
    return Padding(
      padding:
          const EdgeInsets.fromLTRB(kDefaultPadding, 20, kDefaultPadding, 20),
      child: Column(
        children: [
          SectionTitle(title: "Combo này bao gồm"),
          Padding(
            padding: const EdgeInsets.only(left: kDefaultPadding, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...List.generate(
                  pass.includingDestination.length,
                  (index) {
                    Widget result;
                    switch (pass.includingDestination[index].type) {
                      case IncludingDestination.allIncluded:
                        result = _buildDestinationList(
                          itemList: pass.includingDestination[index].destinationList,
                          context: context,
                          currentIndex: _currentIndex,
                        );
                        _currentIndex +=
                            pass.includingDestination[index].destinationList.length;
                        break;
                      case IncludingDestination.binaryOptional:
                        result = _buildDestinationListItem(
                            name:
                                pass.includingDestination[index].destinationList[0].getShortName,
                            secondName:
                                pass.includingDestination[index].destinationList[1].getShortName,
                            context: context,
                            index: _currentIndex++);
                        break;
                      case IncludingDestination.optional:
                        result = _buildOptionalDestinationList(
                            itemList:
                                pass.includingDestination[index].destinationList,
                            includingQuota:
                                pass.includingDestination[index].includingQuota,
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
          )
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
          name: itemList[index].getShortName,
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
          name: itemList[index].getShortName,
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
    return Expanded(
          child: RichText(
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: [
            TextSpan(text: name.toUpperCase() + " "),
            TextSpan(text: "HOẶC ", style: TextStyle(color: primaryLightColor)),
            TextSpan(text: secondName.toUpperCase()),
          ],
        ),
      ),
    );
  }
  return Expanded(
      child: Text(
      name.toUpperCase(),
      style: TextStyle(fontSize: 14),
    ),
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
