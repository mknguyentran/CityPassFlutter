import 'package:flutter/material.dart';

class InfoTag extends StatelessWidget {
  const InfoTag(
    String this.text, {
    Key key,
    @required this.backgroundColor,
    @required this.foregroundColor,
  }) : super(key: key);

  final Color backgroundColor, foregroundColor;
  final text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(5)),
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
      child: Text(
        text,
        style: TextStyle(color: foregroundColor, fontSize: 13),
      ),
    );
  }
}
