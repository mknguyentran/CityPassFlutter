import 'dart:convert';
import 'package:city_pass/models/pass.dart';
import 'package:city_pass/models/user_pass_payment.dart';

import 'package:http/http.dart' as http;
import 'package:city_pass/api_constant.dart';

class UserPassAPI {
  Future<bool> insertUserPass(
      Function(String) onError, UserPassPayment userPassPay) async {
    Map<String, dynamic> userPassPayment = userPassPay.toJson();
    print(userPassPay.toStringDetail());
    var test = jsonEncode(userPassPayment);

    // final response = await http.post(
    //   Uri.https("citypasswebapi.azurewebsites.net", "api/user-passes"),
    //   headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //   },
    //   body: jsonEncode(userPassPayment),
    // );
    final response = await http.post(
      "https://citypasswebapi.azurewebsites.net/api/user-passes",
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(userPassPayment),
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      print(response);
      throw Exception('Failed to buy user pass.');
    }
  }
}
