import 'dart:convert';

import 'package:city_pass/api_constant.dart';
import 'package:city_pass/models/category.dart';
import 'package:http/http.dart' as http;

class CategoryAPI {
  Future<List<ActivityCategory>> getCategoryList(
      Function(String) onError) async {
    String endpoint = listCategoryGETUrl;
    List<ActivityCategory> list = [];
    http.Response response = await http.get(endpoint);
    if (response.statusCode == 200) {
      try {
        dynamic jsonRaw = json.decode(response.body);
        List<dynamic> data = jsonRaw["data"];
        if (data.length > 0) {
          data.forEach((p) {
            list.add(ActivityCategory.fromJson(p));
          });
        }
      } catch (e) {
        print(e);
        onError("Something get wrong!");
      }
    } else {
      onError("Something get wrong! Status code ${response.statusCode}");
    }
    return list;
  }
}
