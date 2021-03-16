import 'package:city_pass/models/city.dart';
import 'package:flutter/material.dart';

class Locations extends StatelessWidget {
  final City city;

  const Locations({Key key, this.city}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(alignment: Alignment.center, child: Text("Location Tab"));
  }
}
