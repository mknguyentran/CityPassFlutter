import 'package:city_pass/constants.dart';
import 'package:city_pass/model/activity.dart';
import 'package:city_pass/model/pass.dart';
import 'package:city_pass/models/passDetailInformation.dart';
import 'package:city_pass/models/ticketType.dart';
import 'package:city_pass/screens/activity_detail/activity_detail.dart';
import 'package:city_pass/service/ticketType_services.dart';
import 'package:city_pass/shared/section_title.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PassDetailContent extends StatefulWidget {
  const PassDetailContent(
      {Key key,
      @required this.passDetail,
      @required this.chosenList,
      this.onOptionChose})
      : super(key: key);

  final PassDetailInformation passDetail;
  final Set chosenList;
  final Function onOptionChose;

  @override
  _PassDetailContentState createState() => _PassDetailContentState();
}

class _PassDetailContentState extends State<PassDetailContent> {
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
                  widget.passDetail.listOfTicket.length,
                  (index) {
                    Widget result;
                    List<String> list = widget.passDetail.listOfTicket[index];
                    int type = IncludingDestination(
                            list, int.parse(list[list.length - 1]))
                        .type;
                    switch (type) {
                      case IncludingDestination.allIncluded:
                        result = _buildDestinationList(
                          itemList: list,
                          context: context,
                          currentIndex: _currentIndex,
                        );
                        _currentIndex += widget
                                .passDetail.listOfTicket[index].length -
                            1; // trừ vì list TicketType trả về cuối cùng là maxContraints
                        break;
                      case IncludingDestination.optional:
                        result = _buildOptionalDestinationList(
                          itemList: list,
                          includingQuota: int.parse(list[list.length - 1]),
                          context: context,
                          onOptionChose: widget.onOptionChose
                        );
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

  Column _buildOptionalDestinationList({
    @required List<String> itemList,
    @required int includingQuota,
    @required BuildContext context,
    @required Function onOptionChose,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OptionalDestinationListHeader(includingQuota: includingQuota),
        ...List.generate(
          itemList.length - 1,
          (index) => _buildOptionalDestinationListItem(
            activity: itemList[index],
            context: context,
            includingQuota: includingQuota,
            onOptionChose: onOptionChose,
          ),
        )
      ],
    );
  }

  Column _buildDestinationList({
    @required List<String> itemList,
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
      @required String activity,
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
          _buildItemName(activity, context)
        ],
      ),
    );
  }

  Widget _buildOptionalDestinationListItem({
    int index,
    double lineSpacing = 7.0,
    @required String activity,
    @required int includingQuota,
    @required Function onOptionChose,
    @required BuildContext context,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: lineSpacing),
      // child: Row(
      //   children: [
      //     Container(
      //       margin: EdgeInsets.only(right: 10),
      //       alignment: Alignment.center,
      //       width: getProportionateScreenWidth(25),
      //       height: getProportionateScreenWidth(25),
      //       decoration: BoxDecoration(
      //         shape: BoxShape.circle,
      //         color: dividerColor,
      //       ),
      //       child: Text(
      //         (index != null) ? index.toString() : "",
      //         style: TextStyle(
      //           color: primaryDarkColor,
      //           fontWeight: FontWeight.bold,
      //           fontSize: 14,
      //         ),
      //       ),
      //     ),
      //     _buildItemName(activity, context)
      //   ],
      // ),
      child: CheckboxListTile(
        dense: true,
        title: _buildItemName(activity, context),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        activeColor: primaryLightColor,
        value: widget.chosenList.contains(activity),
        onChanged: (widget.chosenList.length == includingQuota &&
                !widget.chosenList.contains(activity))
            ? null
            : (isChosen) {
                if (isChosen) {
                  setState(
                    () {
                      widget.chosenList.add(activity);
                    },
                  );
                } else {
                  setState(
                    () {
                      widget.chosenList.remove(activity);
                    },
                  );
                }
                onOptionChose();
              },
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }

  Widget _buildItemName(String activity, BuildContext context) {
    return GestureDetector(
      // onTap: () {
      //   Navigator.push(
      //     context,
      //     CupertinoPageRoute(builder: (context) {
      //       return ActivityDetail(
      //         ticketTypeID: activity.id,
      //       );
      //     }),
      //   );
      // },
      child: Text(
        activity.toUpperCase(),
        style: TextStyle(fontSize: 14),
      ),
    );
  }
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
