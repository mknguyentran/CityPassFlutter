import 'dart:convert';
import 'package:city_pass/models/user_pass_available_show.dart';
import 'package:http/http.dart' as http;
import 'package:city_pass/api_constant.dart';

class UserPassAvailableAPI {
  Future<List<AvailableUserPass>> getAllAvailablePass(Function(String) onError, String userID) async {
    String endpoint = userPassAvailableGETUrl + userID;

    List<AvailableUserPass> availableUserPass = List();
    http.Response response = await http.get(endpoint);
    if (response.statusCode == 200) {
      try {
        dynamic jsonRaw = json.decode(response.body);
        List<dynamic> data = jsonRaw;
        if (data.length > 0) {
          data.forEach((p) {
            availableUserPass.add(AvailableUserPass.formJson(p));
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


  //  Future<TicketTypeDetail> getTicketTypeByID({Function(String) onError, String id}) async {
  //   String endpoint = ticketTypeByIDGETUrl + id;

  //   TicketTypeDetail ticketType;
  //   http.Response response = await http.get(endpoint);
  //   if (response.statusCode == 200) {
  //     try {
  //       dynamic jsonRaw = json.decode(response.body);
  //        ticketType = TicketTypeDetail.formJson(jsonRaw);
        
  //     } catch (e) {
  //       print(e);
  //       onError("Something get wrong!");
  //     }
  //   } else {
  //     onError("Something get wrong! Status code ${response.statusCode}");
  //   }
  //   return ticketType;
  // }
}
