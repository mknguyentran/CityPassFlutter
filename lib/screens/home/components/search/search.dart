import 'package:city_pass/constants.dart';
import 'package:city_pass/models/pass.dart';
import 'package:city_pass/models/city.dart';
import 'package:city_pass/models/ticketType.dart';
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
      body: Padding(
        padding: EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: [
            SearchField(
              height: 45,
              width: double.infinity,
              hintText: 'Tìm kiếm combo, địa điểm, ...',
              boxShadow: [kDefaultShadow],
              // onSubmit: (value) {
              //   setState(() {
              //     _searchValue = value.trim();
              //   });
              //   var currentCity;
              //   if (widget.city != null) {
              //     currentCity = widget.city;
              //   }
                
              //   ticketTypeList = TicketTypeAPI().getAllTicketTypes(city: currentCity, name: value.trim());
              //   passList = PassAPI().getAllPasses(city: currentCity, name: value.trim()); 
              // },
            ),
            FutureBuilder(
              future: ticketTypeList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text('Địa điểm tại ${widget.city.name}');
                } else if (!snapshot.hasData) {
                  if (_searchValue != null && _searchValue.isNotEmpty) {
                    return Center(
                      child: Text('Không tìm thấy dữ liệu'),
                    );
                  }

                  return Container(width: 0, height: 0,);
                }

                return Center(
                  child: CircularProgressIndicator(),
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
    );
  }
}