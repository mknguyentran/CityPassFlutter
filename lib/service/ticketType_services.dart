import 'dart:convert';
import 'package:city_pass/models/ticketType.dart';
import 'package:city_pass/models/ticketTypeDetail.dart';
import 'package:flutter_guid/flutter_guid.dart';
import 'package:http/http.dart' as http;
import 'package:city_pass/api_constant.dart';

class TicketTypeAPI {
  Future<List<TicketType>> getAllTicketTypes({Function(String) onError}) async {
    String endpoint = listTicketTypeGETUrl;

    List<TicketType> ticketTypes = List();
    http.Response response = await http.get(endpoint);
    if (response.statusCode == 200) {
      try {
        dynamic jsonRaw = json.decode(response.body);
        List<dynamic> data = jsonRaw["data"];
        if (data.length > 0) {
          data.forEach((p) {
            ticketTypes.add(TicketType.formJson(p));
          });
        }
      } catch (e) {
        print(e);
        onError("Something get wrong!");
      }
    } else {
      onError("Something get wrong! Status code ${response.statusCode}");
    }
    return ticketTypes;
  }


   Future<TicketTypeDetail> getTicketTypeByID({Function(String) onError, String id}) async {
    String endpoint = ticketTypeByIDGETUrl + id;

    TicketTypeDetail ticketType;
    http.Response response = await http.get(endpoint);
    if (response.statusCode == 200) {
      try {
        dynamic jsonRaw = json.decode(response.body);
         ticketType = TicketTypeDetail.formJson(jsonRaw[0]);
        
      } catch (e) {
        print(e);
        onError("Something get wrong!");
      }
    } else {
      onError("Something get wrong! Status code ${response.statusCode}");
    }
    return ticketType;
  }

  
}
