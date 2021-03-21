import 'dart:convert';

import 'package:city_pass/api_constant.dart';
import 'package:city_pass/models/city.dart';
import 'package:http/http.dart' as http;

class CityAPI {
  Future<List<City>> getAllCities({Function(String) onError}) async {
    String endpoint = listCitiesGETUrl;

    List<City> cityList = [];
    http.Response response = await http.get(endpoint);
    if (response.statusCode == 200) {
      try {
        dynamic jsonRaw = json.decode(response.body);
        List<dynamic> data = jsonRaw["data"];
        if (data.length > 0) {
          data.forEach((city) {
            cityList.add(City.fromJson(city));
          });
        }
      } catch(e) {
        onError("Something is wrong");
      }
    } else {
      onError("Something is wrong. Status code ${response.statusCode}");
    }
    return cityList;
  }

  Future<List<City>> getCitiesByName(String name, {Function(String) onError}) async {
    String endpoint = listCitiesGETUrl;
    String queryString = Uri(queryParameters: {'Name': name}).query;

    List<City> cityList = [];
    http.Response response = await http.get(endpoint + '?' + queryString);
    if (response.statusCode == 200) {
      try {
        dynamic jsonRaw = json.decode(response.body);
        List<dynamic> data = jsonRaw["data"];
        if (data.length > 0) {
          data.forEach((city) {
            cityList.add(City.fromJson(city));
          });
        }
      } catch(e) {
        onError("Something is wrong");
      }
    } else {
      onError("Something is wrong. Status code ${response.statusCode}");
    }
    return cityList;
  }
}