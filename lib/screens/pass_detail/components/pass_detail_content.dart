import 'package:city_pass/constants.dart';
import 'package:city_pass/shared/section_title.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/material.dart';

class PassDetailContent extends StatelessWidget {
  const PassDetailContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const destinationListLineSpacing = 7.0;
    return Padding(
      padding:
          const EdgeInsets.fromLTRB(kDefaultPadding, 20, kDefaultPadding, 20),
      child: Column(
        children: [
          SectionTitle(title: "CityPass này bao gồm"),
          Padding(
            padding: const EdgeInsets.only(left: kDefaultPadding, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDestinationListItem(
                  context: context,
                  index: 1,
                  name: "ĐẦM SEN NƯỚC",
                ),
                _buildDestinationListItem(
                  context: context,
                  index: 2,
                  name: "ĐẦM SEN KHÔ",
                  secondName: "ABC",
                ),
                _buildDestinationListItem(
                  context: context,
                  name: "ĐẦM SEN KHÔ",
                  secondName: "ABC",
                ),
                OptionalDestinationListHeader(
                  lineSpacing: destinationListLineSpacing,
                  itemAmount: 3,
                )
              ],
            ),
          )
        ],
      ),
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
}

class OptionalDestinationListHeader extends StatelessWidget {
  const OptionalDestinationListHeader({
    Key key,
    @required this.lineSpacing,
    @required this.itemAmount,
  })  : assert(itemAmount > 2),
        super(key: key);

  final double lineSpacing;
  final int itemAmount;

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
                text: "$itemAmount địa điểm ",
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
