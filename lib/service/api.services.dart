import 'dart:convert';
import 'package:city_pass/service/ticketType.dart';
import 'package:http/http.dart' as http;


class Api{
  Future<List<TicketType>> getAllTicketTypes({Function(String) onError})async{
    String endpoint = 'https://citypasswebapi.azurewebsites.net/api/ticket-types';
    List<TicketType> ticketTypes = List();
    http.Response response = await http.get(endpoint);
    if(response.statusCode == 200){
     try{
       dynamic jsonRaw = json.decode(response.body);
       List<dynamic> data = jsonRaw["data"];
       data.forEach((p) {
         var a = {'name': 'abc', 'age': 15};
         print(a);
         ticketTypes.add(TicketType.formJson(p));
        });
     }catch(e){
       onError("Something get wrong!");
     }
    }else{
       onError("Something get wrong! Status code ${response.statusCode}");
    }
    return ticketTypes;
  }

}