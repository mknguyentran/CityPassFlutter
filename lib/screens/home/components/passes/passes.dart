import 'package:city_pass/constants.dart';
import 'package:city_pass/mockupData/mockup_pass.dart';
import 'package:city_pass/models/city.dart';
import 'package:city_pass/models/pass.dart';
import 'package:city_pass/screens/pass_detail/pass_detail.dart';
import 'package:city_pass/service/pass_services.dart';
import 'package:city_pass/shared/pass_card.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Passes extends StatefulWidget {
  final City city;

  const Passes({Key key, this.city}) : super(key: key);

  @override
  _PassesState createState() => _PassesState();
}

class _PassesState extends State<Passes> {
  @override
  Widget build(BuildContext context) {
    Future<List<Pass>> listPasses;
    listPasses = PassAPI().getAllPasses(city: widget.city);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding)
            .add(EdgeInsets.only(top: 20)),
        child: FutureBuilder(
          future: listPasses,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  ...List.generate(
                    snapshot.data.length,
                    (index) => Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: PassCard(
                          pass: snapshot.data[index],
                          press: () {
                            Navigator.push(context,
                                CupertinoPageRoute(builder: (context) {
                              return PassDetail(
                                passId: snapshot.data[index].id,
                              );
                            }));
                          }),
                    ),
                  )
                ],
              );
            } else {
              return Center(
                child: Container(
                  height: percentageOfScreenHeight(20),
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
