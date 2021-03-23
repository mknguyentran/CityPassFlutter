import 'package:flutter_guid/flutter_guid.dart';

class PassDetailInformation {
  Guid id;
  String name;
  String description;
  double price;
  double rate;
  int expireDuration;
  var feedbacks;
  List<Object> collections;
  List<Object> ticketTypes;
  List<List> listOfTicket;
  int type;
  String imageUrl;

  int get totalOptionalAmount {
    int result = 0;
    for (var item in listOfTicket) {
      if (int.parse(item[item.length - 1]) < (item.length - 1)) {
        result += int.parse(item[item.length - 1]);
      }
    }
    return result;
  }

  PassDetailInformation.formJson(Map<String, dynamic> json)
      : this.id = new Guid(json['id']),
        this.name = json['name'],
        this.price = json['price'],
        this.description = json['description'],
        this.expireDuration = json['expireDuration'],
        this.feedbacks = json['feedbacks'],
        this.collections = json['collections'],
        this.imageUrl = json['urlImage'],
        this.rate = json['rate'] {
    listOfTicket = [];
    for (int i = 0; i < collections.length; i++) {
      List<dynamic> ticketInCollection = [];
      this.ticketTypes = json['collections'][i]['ticketTypes'];
      int maxCostraints = json['collections'][i]['maxConstrain'];
      for (int j = 0; j < ticketTypes.length; j++) {
        String ticketTypeName =
            json['collections'][i]['ticketTypes'][j]['name'];
        String id = json['collections'][i]['ticketTypes'][j]['id'];
        List<Object> ticket = [];
        ticket.add(id);
        ticket.add(ticketTypeName);
        ticketInCollection.add(ticket);
        // Object ticketTypeName =
        //     json['collections'][i]['ticketTypes'][j];
        // ticketInCollection.add(ticketTypeName);
      }
      ticketInCollection.add(maxCostraints.toString());
      listOfTicket.add(ticketInCollection);
    }
  }
}

// void getDetailCollection(Map<String, dynamic> json){
//   for(int i = 0; i < collections.length; i++){
//       List<String> ticketTypesOfCollection = new List();
//       for(int j = 0; j < ticketTypes.length; j++){
//           String ticketTypeName = ;
//       }

//   }
// }
