import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:photo_view/photo_view.dart';

class MapScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(context),
      body:
      // SizedBox(
      //   height: MediaQuery.of(context).size.height,
      //   child: FittedBox(
      //     fit: BoxFit.fitHeight,
          PhotoView(
            imageProvider: AssetImage("assets/images/map.png"),
            customSize: MediaQuery.of(context).size,
          )
      //   ),
      // ),
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
      title: Text("Bản đồ"),
    );
  }
}