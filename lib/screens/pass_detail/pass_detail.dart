import 'package:city_pass/constants.dart';
import 'package:city_pass/model/pass.dart';
import 'package:city_pass/screens/pass_detail/components/pass_detail_content.dart';
import 'package:city_pass/screens/pass_detail/components/pass_detail_header.dart';
import 'package:city_pass/screens/pass_detail/components/pass_detail_price_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/choose_pass_amount.dart';

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
            PassDetailHeader(pass: widget.pass),
            PassDetailPriceBar(pass: widget.pass),
            Divider(
              color: dividerColor,
              thickness: 10,
              height: 20,
            ),
            PassDetailContent(pass: widget.pass),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
              kDefaultPadding, 10, kDefaultPadding, 10),
          child: Container(
            height: 50,
            width: double.infinity,
            child: _buildBuyButton(context),
          ),
        ),
      ),
    );
  }

  ElevatedButton _buildBuyButton(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(primaryLightColor),
        textStyle: MaterialStateProperty.all(
          TextStyle(
            fontFamily: "SFProRounded",
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      onPressed: () {
        showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return ChoosePassAmount(pass: widget.pass);
            });
      },
      child: Text(
        'Mua ngay',
        style: TextStyle(fontSize: 20),
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
