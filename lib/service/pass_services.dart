import 'dart:convert';
import 'package:city_pass/models/pass.dart';
import 'package:city_pass/models/passDetailInformation.dart';

import 'package:http/http.dart' as http;
import 'package:city_pass/api_constant.dart';

class PassAPI {
  Future<List<Pass>> getAllPasses({Function(String) onError}) async {
    String endpoint = listPassesGETUrl;

    List<Pass> passList = List();
    http.Response response = await http.get(endpoint);
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
        print(e);
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
