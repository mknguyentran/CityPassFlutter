import 'package:city_pass/constants.dart';
import 'package:city_pass/screens/activity_detail/components/body/activity_including_passes.dart';
import 'package:city_pass/screens/activity_detail/components/body/activity_info.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/material.dart';

class ActivityBody extends StatefulWidget {
  @override
  _ActivityBodyState createState() => _ActivityBodyState();
}

class _ActivityBodyState extends State<ActivityBody>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: getProportionateScreenWidth(300),
            height: getProportionateScreenHeight(35),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300], width: 4),
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            child: TabBar(
              controller: _tabController,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                  _tabController.animateTo(index);
                });
              },
              indicator: BoxDecoration(
                boxShadow: [smallShadow],
                borderRadius: BorderRadius.circular(
                  7,
                ),
                color: cityPassDarkColor,
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              tabs: [
                Tab(
                  text: "Thông tin",
                ),
                Tab(
                  text: "Mua CityPass",
                ),
              ],
            ),
          ),
          VerticalSpacing(),
          IndexedStack(
            children: [
              Visibility(
                child: ActivityInfo(),
                maintainState: true,
                visible: selectedIndex == 0,
              ),
              Visibility(
                child: ActivityIncludingPasses(),
                maintainState: true,
                visible: selectedIndex == 1,
              ),
            ],
            index: selectedIndex,
          ),
        ],
      ),
    );
  }
}
