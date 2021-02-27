import 'package:city_pass/models/city.dart';
import 'package:flutter/material.dart';

class Passes extends StatelessWidget {
  final City city;

  const Passes({Key key, @required this.city}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(alignment: Alignment.center, child: Text("Passes Tab"));
  }
}
