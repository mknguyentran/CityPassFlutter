import 'package:city_pass/constants.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/material.dart';

class CustomNavBar extends StatefulWidget {
  final Color backgroundColor;
  final Color itemColor;
  final List<CustomNavItem> children;
  final int currentIndex;
  final int focusedIndex;
  final Function(int) onChange;
  final Function() focusedAction;

  const CustomNavBar({
    Key key,
    this.backgroundColor = Colors.white,
    this.itemColor = cityPassDarkColor,
    this.currentIndex = 0,
    @required this.children,
    @required this.focusedIndex,
    @required this.onChange,
    @required this.focusedAction,
  })  : assert(focusedIndex >= 0 && focusedIndex < children.length),
        super(key: key);

  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {

  void _changeIndex(int index) {
    if (widget.onChange != null) {
      widget.onChange(index);
    }
  }

  void _focusedAction() {
    if (widget.focusedAction != null) {
      widget.focusedAction();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenWidth(80),
      decoration: BoxDecoration(
        boxShadow: [kDefaultShadow],
        color: Colors.white,
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: widget.children.map((item) {
              int index = widget.children.indexOf(item);
              bool isCurrent = widget.currentIndex == index;
              bool isFocused =
                  widget.focusedIndex != null && widget.focusedIndex == index;
              return GestureDetector(
                onTap: () {
                  isFocused ? _focusedAction() : _changeIndex(index);
                },
                child: Container(
                  padding: EdgeInsets.all(5),
                  height: getProportionateScreenWidth(60),
                  width: getProportionateScreenWidth(60),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [if (isFocused) kDefaultShadow],
                  ),
                  child: _buildNavItem(item, isCurrent, isFocused),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Column _buildNavItem(
      CustomNavItem item, bool isCurrentIndex, bool isFocused) {
    if (item.label != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            item.icon,
            size: 28,
            color: isCurrentIndex ? widget.itemColor : kIconColor,
          ),
          Spacer(),
          Text(
            item.label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: isCurrentIndex ? widget.itemColor : kIconColor,
            ),
          )
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            item.icon,
            size: 45,
            color: isFocused ? widget.itemColor : kIconColor,
          ),
        ],
      );
    }
  }
}

class CustomNavItem {
  final IconData icon;
  final String label;

  CustomNavItem({@required this.icon, this.label});
}
