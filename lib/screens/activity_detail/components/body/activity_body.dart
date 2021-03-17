import 'package:city_pass/constants.dart';
import 'package:city_pass/models/activity.dart';
import 'package:city_pass/screens/activity_detail/components/body/activity_images.dart';
import 'package:city_pass/screens/activity_detail/components/body/activity_info.dart';
import 'package:city_pass/service/ticketType.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/material.dart';

class ActivityBody extends StatefulWidget {
 // final Activity activity;
  final TicketType activity;

  const ActivityBody({
    Key key,
    @required this.activity,
  }) : super(key: key);

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

  _changeTab(index) {
    setState(() {
      selectedIndex = index;
      _tabController.animateTo(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: getProportionateScreenWidth(300),
            height: 35,
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
                _changeTab(index);
              },
              indicator: BoxDecoration(
                boxShadow: [smallShadow],
                borderRadius: BorderRadius.circular(
                  7,
                ),
                color: primaryDarkColor,
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              labelStyle: TextStyle(
                fontWeight: FontWeight.w500,
                letterSpacing: -1,
                fontSize: 16,
              ),
              tabs: [
                Tab(
                  text: "Thông tin",
                ),
                Tab(
                  text: "Hình ảnh",
                ),
              ],
            ),
          ),
          VerticalSpacing(),
          IndexedStack(
            children: [
              Visibility(
                child: ActivityInfo(activity: widget.activity),
                maintainState: true,
                visible: selectedIndex == 0,
              ),
              Visibility(
                child: ActivityImages(activity: widget.activity),
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
