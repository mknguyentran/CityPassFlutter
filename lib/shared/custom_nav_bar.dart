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
    this.itemColor = primaryDarkColor,
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
      height: getProportionateScreenWidth(70),
      decoration: BoxDecoration(
        boxShadow: [topShadow],
        color: widget.backgroundColor,
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  padding: EdgeInsets.symmetric(horizontal:0),
                  height: getProportionateScreenWidth(55),
                  width: getProportionateScreenWidth(55),
                  decoration: BoxDecoration(
                    color: isFocused ? widget.backgroundColor : null,
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
    var _selectedIcon = item.selectedIcon ?? item.icon;
    if (item.label != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            isCurrentIndex ? _selectedIcon : item.icon,
            size: 28,
            color: isCurrentIndex ? widget.itemColor : kIconColor,
          ),
          Text(
            item.label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: isCurrentIndex ? widget.itemColor : kIconColor,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
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
  final IconData selectedIcon;
  final String label;

  CustomNavItem({@required this.icon, this.label, this.selectedIcon});
}
