import 'dart:convert';
import 'package:city_pass/models/user_pass_outdated_show.dart';
import 'package:http/http.dart' as http;
import 'package:city_pass/api_constant.dart';

class OutDatedPassAPI {
  Future<List<OutdatedUserPass>> getAllOutdatedPass(
      Function(String) onError, String userID) async {
    String endpoint = userPassOutdatedGETUrl + userID;

    List<OutdatedUserPass> availableUserPass = List();
    http.Response response = await http.get(endpoint);
    if (response.statusCode == 200) {
      try {
        dynamic jsonRaw = json.decode(response.body);
        List<dynamic> data = jsonRaw;
        if (data.length > 0) {
          data.forEach((p) {
            availableUserPass.add(OutdatedUserPass.formJson(p));
          });
        }
      } catch (e) {
        print(e);
        onError("Something get wrong!");
      }
    } else {
      onError("Something get wrong! Status code ${response.statusCode}");
    }
    return availableUserPass;
  }
}
