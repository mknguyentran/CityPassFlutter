import 'package:city_pass/constants.dart';
import 'package:city_pass/screens/history/available.dart';
import 'package:city_pass/screens/history/outdated.dart';
import 'package:flutter/material.dart';

class HistoryForm extends StatefulWidget {
  @override
  _HistoryFormState createState() => _HistoryFormState();
}

class _HistoryFormState extends State<HistoryForm>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String title = "Đơn Hàng Của Tôi";
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(fontSize: 17, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: primaryLightColor,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: kWhiteIconColor,
          tabs: <Widget>[
            Tab(
              text: "Còn hiệu lực",
            ),
            Tab(
              text: "Hết hiệu lực",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[AvailablePass(), OutDatedPass()],
      ),
    );
  }
}
