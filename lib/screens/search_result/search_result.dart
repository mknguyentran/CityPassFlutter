import 'package:city_pass/constants.dart';
import 'package:city_pass/mockupData/mockup_activity.dart';
import 'package:city_pass/mockupData/mockup_pass.dart';
import 'package:city_pass/models/activity.dart';
import 'package:city_pass/models/pass.dart';
import 'package:city_pass/screens/home/components/explore/components/activity_recommendation.dart';
import 'package:city_pass/screens/home/components/explore/components/pass_recommendation.dart';
import 'package:city_pass/shared/search_field.dart';
import 'package:city_pass/size_config.dart';
import 'package:flutter/material.dart';

class SearchResult extends StatefulWidget {
  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  String _searchTerm = "";
  List<Activity> _activitySearchResult = [];
  List<Pass> _passSearchResult = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrayBackground,
      appBar: buildAppBar(_searchTerm),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: SearchResultContent(
            searchTerm: _searchTerm,
            passSearchResult: _passSearchResult,
            activitySearchResult: _activitySearchResult),
      ),
    );
  }

  void _submitSearchTerm(String value) {
    setState(() {
      _searchTerm = value;
      _getSearchResult(value);
    });
  }

  void _getSearchResult(String value) {
    var term = value.toLowerCase();
    _activitySearchResult = mockupActivities
        .where((element) => element.name.toLowerCase().contains(term))
        .toList();
    _passSearchResult = mockupPasses
        .where((element) => element.name.toLowerCase().contains(term))
        .toList();
  }

  AppBar buildAppBar(String title) {
    var _brightness = Brightness.dark;
    var _bottom = PreferredSize(
      preferredSize: Size.fromHeight(55),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding).add(
          const EdgeInsets.only(bottom: 10),
        ),
        child: SearchField(
          onSubmitted: (value) => _submitSearchTerm(value),
          height: 40,
          width: double.infinity,
          hintText: "Tìm kiếm điểm đến, hoạt đông,...",
          boxShadow: [kDefaultShadow],
          isButton: false,
        ),
      ),
    );
    return AppBar(
      title: title.trim().isEmpty
          ? Text("Tìm kiếm")
          : Text("Tìm kiếm \"${title}\""),
      shadowColor: secondaryColor,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [primaryDarkColor, secondaryColor]),
        ),
      ),
      leading: IconButton(
        icon: Icon(
          Icons.chevron_left_rounded,
          size: 30,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      brightness: _brightness,
      elevation: 5,
      bottom: _bottom,
    );
  }
}

class SearchResultContent extends StatelessWidget {
  const SearchResultContent({
    Key key,
    @required String searchTerm,
    @required List<Pass> passSearchResult,
    @required List<Activity> activitySearchResult,
  })  : _searchTerm = searchTerm,
        _passSearchResult = passSearchResult,
        _activitySearchResult = activitySearchResult,
        super(key: key);

  final String _searchTerm;
  final List<Pass> _passSearchResult;
  final List<Activity> _activitySearchResult;

  @override
  Widget build(BuildContext context) {
    if (_searchTerm.trim().isEmpty) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal:kDefaultPadding),
        height: 200,
        alignment: Alignment.center,
        child: Text(
          "Bạn muốn tìm kiếm gì?",
          style: TextStyle(color: subtitleTextColor, fontSize: 20),
          textAlign: TextAlign.center,
        ),
      );
    } else if (_passSearchResult.length == 0 &&
        _activitySearchResult.length == 0) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal:kDefaultPadding),
        height: 200,
        alignment: Alignment.center,
        child: Text(
          "Không tìm thấy kết quả nào với từ khoá \"${_searchTerm}\". \nHãy thử lại với từ khoá khác. ",
          style: TextStyle(color: subtitleTextColor, fontSize: 20),
          textAlign: TextAlign.center,
        ),
      );
    } else {
      return Column(
        children: [
          if(_passSearchResult.length!=0)
          _buildPassSearchResult(),
          if(_passSearchResult.length!=0)
          VerticalSpacing(of: 30),
          _buildActivitySearchResult(),
        ],
      );
    }
  }

  ActivityRecommendation _buildActivitySearchResult() {
    return ActivityRecommendation(
        title: "Các hoạt động có chứa \"${_searchTerm}\"",
        children: _activitySearchResult);
  }

  PassRecommendation _buildPassSearchResult() {
    return PassRecommendation(
        title: "Các Combo có chứa \"${_searchTerm}\"",
        children: _passSearchResult);
  }
}
