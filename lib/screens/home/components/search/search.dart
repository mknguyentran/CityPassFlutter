import 'package:city_pass/constants.dart';
import 'package:city_pass/models/pass.dart';
import 'package:city_pass/models/city.dart';
import 'package:city_pass/models/ticketType.dart';
import 'package:city_pass/screens/home/components/explore/components/activity_recommendation_card_vertical.dart';
import 'package:city_pass/screens/home/components/explore/components/activity_recommendation_vertical.dart';
import 'package:city_pass/service/pass_services.dart';
import 'package:city_pass/service/ticketType_services.dart';
import 'package:city_pass/shared/search_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  final City city;

  const SearchPage({Key key, this.city}) : super(key: key);
  
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _searchValue;
  Future<List<TicketType>> ticketTypeList;
  Future<List<Pass>> passList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      backgroundColor: lightGrayBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: ticketTypeList,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator()
                  );
                }

                if (snapshot.hasData) {
                  if (snapshot.data.length > 0) {
                    return Padding(
                      padding: EdgeInsets.all(kDefaultPadding),
                      child: Column(
                        children: [
                          ActivityRecommendationVertical(
                            hasPadding: false,
                            title: 'Địa điểm tại ' + (widget.city != null ? widget.city.name: 'Việt Nam'),
                            children: snapshot.data,
                          ),
                        ]
                      ),
                    );
                  } else {
                    return Padding(
                      padding: EdgeInsets.all(kDefaultPadding),
                      child: Text(
                        'Không tìm thấy dữ liệu',
                        style: TextStyle(
                          color: Colors.red
                        ),
                      ),
                    );
                  }
                }

                return Center(
                  child: Container(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      brightness: Brightness.light,
      leading: IconButton(
        color: primaryDarkColor,
        icon: Icon(
          Icons.chevron_left_rounded,
          size: 30,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      title: Text(
        'Tìm kiếm',
        style: TextStyle(color: textBlack),
      ),
      centerTitle: true,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: Padding(
          padding: EdgeInsets.all(kDefaultPadding),
          child: SearchField(
            height: 45,
            width: double.infinity,
            hintText: 'Tìm kiếm địa điểm',
            boxShadow: [kDefaultShadow],
            onSubmit: (value) {
              setState(() {
                _searchValue = value.trim();
              });
              
              if (value.isNotEmpty) {
                ticketTypeList = TicketTypeAPI().getAllTicketTypes(city: widget.city, name: value.trim());
                passList = PassAPI().getAllPasses(city: widget.city, name: value.trim()); 
              } 
              
            },
          ),
        )
      ),
    );
  }
}