import 'package:city_pass/constants.dart';
import 'package:city_pass/models/city.dart';
import 'package:city_pass/shared/search_field.dart';
import 'package:city_pass/shared/section_title.dart';
import 'package:flutter/material.dart';

class CityPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var buttonGroupPadding = EdgeInsets.only(bottom: 20);
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CityButtonGroup(
                groupName: "Miền Bắc",
                cityList: mockupCities[0],
                padding: buttonGroupPadding,
              ),
              CityButtonGroup(
                groupName: "Miền Trung",
                cityList: mockupCities[1],
                padding: buttonGroupPadding,
              ),
              CityButtonGroup(
                groupName: "Miền Nam",
                cityList: mockupCities[2],
                padding: buttonGroupPadding,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CityButtonGroup extends StatelessWidget {
  const CityButtonGroup(
      {Key key,
      @required this.groupName,
      @required this.cityList,
      this.padding})
      : super(key: key);

  final String groupName;
  final List<City> cityList;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding != null ? padding : EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(
            title: groupName,
            lineSpacing: 10,
          ),
          Wrap(
            spacing: 14,
            children: [
              ...List.generate(
                cityList.length,
                (index) => CityButton(city: cityList[index]),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class CityButton extends StatelessWidget {
  const CityButton({
    Key key,
    @required this.city,
  }) : super(key: key);

  final City city;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          textStyle: MaterialStateProperty.all(
            TextStyle(
              fontFamily: "SFProRounded",
              fontSize: 14,
            ),
          ),
          foregroundColor: MaterialStateProperty.all(textBlack),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          elevation: MaterialStateProperty.all(4),
          minimumSize: MaterialStateProperty.all(Size(20, 32)),
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 3,
            ),
          )),
      child: Text(city.name),
      onPressed: () {
        Navigator.of(context).pop(city);
      },
    );
  }
}

AppBar _buildAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    brightness: Brightness.light,
    leading: IconButton(
      icon: Icon(
        Icons.chevron_left_rounded,
        size: 30,
        color: textBlack,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    ),
    title: Text(
      "Chọn điểm đến của bạn",
      style: TextStyle(color: textBlack),
    ),
    centerTitle: true,
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(80),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding)
            .add(const EdgeInsets.only(bottom: 20)),
        child: SearchField(
          height: 45,
          width: double.infinity,
          hintText: "Tìm kiếm điểm đến,...",
          boxShadow: [kDefaultShadow],
        ),
      ),
    ),
  );
}
