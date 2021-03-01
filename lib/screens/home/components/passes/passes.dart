import 'package:city_pass/constants.dart';
import 'package:city_pass/models/city.dart';
import 'package:city_pass/models/pass.dart';
import 'package:city_pass/screens/home/components/featured/search_field.dart';
import 'package:city_pass/screens/pass_detail/pass_detail.dart';
import 'package:city_pass/shared/pass_card.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Passes extends StatelessWidget {
  final City city;

  const Passes({Key key, @required this.city}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 70),
              child: SearchField(
                hintText: "Tìm kiếm CityPass",
                boxShadow: [kPopShadow],
              ),
            ),
            VerticalSpacing(of: 20),
            ...List.generate(
              mockupPasses.length,
              (index) => Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: PassCard(
                  pass: mockupPasses[index],
                  press: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (context) {
                        return PassDetail(
                          pass: mockupPasses[index],
                        );
                      })
                    );
                  }
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}
