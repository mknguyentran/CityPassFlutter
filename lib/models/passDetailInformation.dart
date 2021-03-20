import 'package:city_pass/model/pass.dart';
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

 PassDetailInformation.formJson(Map<String, dynamic> json) :
    this.id = new Guid(json['id']),
    this.name = json['name'],
    this.price = json['price'],
    this.description = json['description'],
    this.expireDuration = json['expireDuration'],
    this.feedbacks = json['feedbacks'],
    this.collections = json['collections'],
    this.rate = json['rate']{
      for (int i = 0; i < collections.length; i++) {
      List<String> ticketInCollection = new List();
      this.ticketTypes = json['collections'][i]['ticketTypes'];
      int maxCostraints = json['collections'][i]['maxConstrain'];
      for (int j = 0; j < ticketTypes.length; j++) {
        String ticketTypeName =
            json['collections'][i]['ticketTypes'][j]['name'];
        ticketInCollection.add(ticketTypeName);
      }
      ticketInCollection.add(maxCostraints.toString());
      listOfTicket = new List();
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

