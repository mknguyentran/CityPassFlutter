import 'dart:convert';
import 'package:city_pass/models/user_pass_available_show.dart';
import 'package:city_pass/models/userpass_use_history.dart';
import 'package:http/http.dart' as http;
import 'package:city_pass/api_constant.dart';

class UserPassHistoryAPI {
  Future<UserPassHistory> getHistoryUserPass(
      Function(String) onError, String userPassId) async {
    String endpoint = userPassHistoryGETUrl + userPassId;

    UserPassHistory historyDetail;
    http.Response response = await http.get(endpoint);
    if (response.statusCode == 200) {
      try {
        dynamic jsonRaw = json.decode(response.body);

        historyDetail = UserPassHistory.formJson(jsonRaw);
      } catch (e) {
        print(e);
        onError("Something get wrong!");
      }
    } else {
      onError("Something get wrong! Status code ${response.statusCode}");
    }
    return historyDetail;
  }
}
