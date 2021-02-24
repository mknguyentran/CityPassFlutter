import 'package:city_pass/models/activity.dart';
import 'package:city_pass/models/pass.dart';
import 'package:city_pass/shared/pass_card.dart';
import 'package:city_pass/screens/pass_detail/pass_detail.dart';
import 'package:city_pass/shared/section_title.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActivityIncludingPasses extends StatelessWidget {
  final Activity activity;

  const ActivityIncludingPasses({Key key, @required this.activity})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(title: "Hoạt động này có trong"),
        VerticalSpacing(
          of: 20,
        ),
        ...List.generate(
          mockupPasses.length,
          (index) => Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: PassCard(
                pass: mockupPasses[index],
                press: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) {
                      return PassDetail(
                        pass: mockupPasses[index],
                      );
                    }),
                  );
                }),
          ),
        )
      ],
    );
  }
}
