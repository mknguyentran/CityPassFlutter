import 'package:flutter_guid/flutter_guid.dart';

class TicketTypeDetail {
  Guid id;
  String name;
  double adultPrice;
  double childrenPrice;
  String urlImage;
  String attractionName;
  String cityName;
  String description;
  String address;

  TicketTypeDetail.formJson(Map<String, dynamic> json){
      this.id = new Guid(json['id']);
        this.name = json['name'];
       
        this.urlImage = json['urlImage'];
        this.adultPrice = json['adultPrice'];
        this.childrenPrice = json['childrenPrice'];
         this.cityName = json['atrraction']['city']['name'];
        this.description = json['atrraction']['description'];
        this.address = json['atrraction']['address'];
        this.attractionName = json['atrraction']['name'];}

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'name': this.name,
        'adultPrice': this.adultPrice,
        'childrenPrice': this.childrenPrice,
        'urlImage': this.urlImage,
        'attraction': {
          'description': this.description,
          'address': this.address,
          'name': this.attractionName,
        },
        'city':{
          'name': this.cityName,
        }
      };
}
