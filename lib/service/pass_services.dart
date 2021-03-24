import 'dart:convert';
import 'package:city_pass/models/city.dart';
import 'package:city_pass/models/pass.dart';
import 'package:city_pass/models/passDetailInformation.dart';

import 'package:http/http.dart' as http;
import 'package:city_pass/api_constant.dart';

class PassAPI {
  Future<List<Pass>> getAllPasses({Function(String) onError, City city, String name, String ticketTypeId}) async {
    String endpoint = listPassesGETUrl;
    String queryString = '';
    Map<String, dynamic> queryParams = {};
    if (city != null) {
      var cityParam = {'cityId': city.id.toString()};
      queryParams.addAll(cityParam);
    }
    if (name != null) {
      var nameParam = {'name': name.trim()};
      queryParams.addAll(nameParam);
    }
    if(ticketTypeId != null){
      var ticketTypeIdParam = {'ticketTypeId': ticketTypeId.trim()};
      queryParams.addAll(ticketTypeIdParam);
    }
    queryString = '?' + Uri(queryParameters: queryParams).query;

    List<Pass> passList = [];
    http.Response response = await http.get(endpoint + queryString);
    if (response.statusCode == 200) {
      try {
        dynamic jsonRaw = json.decode(response.body);
        List<dynamic> data = jsonRaw["data"];
        if (data.length > 0) {
          data.forEach((p) {
            passList.add(Pass.formJson(p));
          });
        }
      } catch (e) {
        onError("Something get wrong!");
      }
    } else {
      onError("Something get wrong! Status code ${response.statusCode}");
    }
    return passList;
  }

  Future<PassDetailInformation> getPassByID(
      {Function(String) onError, String id}) async {
    String endpoint = passByIDGETUrl + id;

    PassDetailInformation passDetail;
    http.Response response = await http.get(endpoint);
    if (response.statusCode == 200) {
      try {
        dynamic jsonRaw = json.decode(response.body);
         passDetail = PassDetailInformation.formJson(jsonRaw);
      } catch (e) {
        print(e);
        onError("Something get wrong!");
      }
    } else {
      onError("Something get wrong! Status code ${response.statusCode}");
    }
    return passDetail;
  }
}
