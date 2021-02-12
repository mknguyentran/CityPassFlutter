import 'package:city_pass/constants.dart';
import 'package:city_pass/models/pass.dart';
import 'package:city_pass/screens/order_detail/order_result.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'choose_pass_amount.dart';

class PassDetail extends StatefulWidget {
  final Pass pass;

  const PassDetail({Key key, @required this.pass}) : super(key: key);

  @override
  _PassDetailState createState() => _PassDetailState();
}

class _PassDetailState extends State<PassDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: Column(
          children: [
            Center(child: Text(widget.pass.name)),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
              kDefaultPadding, 10, kDefaultPadding, 10),
          child: RaisedButton(
            onPressed: () {
              showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return ChoosePassAmount(pass: widget.pass);
                  });
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: const Text('Mua ngay', style: TextStyle(fontSize: 20)),
            ),
            color: primaryLightColor,
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 1,
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      brightness: Brightness.dark,
      leading: IconButton(
        icon: Icon(
          Icons.chevron_left_rounded,
          size: 30,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      actions: [
        IconButton(icon: Icon(Icons.favorite_border_rounded), onPressed: () {})
      ],
    );
  }
}
