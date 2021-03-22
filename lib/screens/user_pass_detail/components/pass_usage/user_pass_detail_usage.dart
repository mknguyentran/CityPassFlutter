import 'package:city_pass/constants.dart';
import 'package:city_pass/model/user_pass.dart';
import 'package:city_pass/models/user_pass_available_show.dart';
import 'package:city_pass/screens/user_pass_detail/components/pass_usage/tabs/available_destinations.dart';
import 'package:city_pass/screens/user_pass_detail/components/pass_usage/tabs/used_destinations.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/material.dart';

class UserPassDetailUsage extends StatefulWidget {
  final AvailableUserPass pass;

  const UserPassDetailUsage({Key key, @required this.pass}) : super(key: key);
  @override
  _UserPassDetailUsageState createState() => _UserPassDetailUsageState();
}

class _UserPassDetailUsageState extends State<UserPassDetailUsage>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  _changeTab(index) {
    setState(() {
      _selectedIndex = index;
      _tabController.animateTo(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: 35,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[200], width: 4),
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          child: TabBar(
            controller: _tabController,
            onTap: (index) {
              _changeTab(index);
            },
            indicator: BoxDecoration(
              boxShadow: [smallShadow],
              borderRadius: BorderRadius.circular(
                7,
              ),
              color: Colors.white,
            ),
            labelColor: primaryDarkColor,
            unselectedLabelColor: Colors.black,
            labelStyle: TextStyle(
              letterSpacing: -1,
              fontSize: 16,
            ),
            unselectedLabelStyle: TextStyle(
              letterSpacing: -1,
              fontSize: 16,
            ),
            tabs: [
              Tab(
                text: "Hoạt động chưa đi",
              ),
              Tab(
                text: "Hoạt động đã đi",
              ),
            ],
          ),
        ),
        VerticalSpacing(),
        IndexedStack(
          children: [
            // Visibility(
            //   child: AvailableDestinations(destinationList: widget.pass.availableDestinationList,),
            //   maintainState: true,
            //   visible: _selectedIndex == 0,
            // ),
            Visibility(
             // child: UsedDestinations(entryList: widget.pass.usedDestinationList,),
              maintainState: true,
              visible: _selectedIndex == 1,
            ),
          ],
          index: _selectedIndex,
        ),
      ],
    );
  }
}
