import 'package:flutter_guid/flutter_guid.dart';

class TicketType {
  final Guid id;
  final String name;
  final String imageUrl;
  final String city;
  final bool isDelete;

  TicketType.formJson(Map<String, dynamic> json)
      : this.id = new Guid(json['id']),
        this.name = json['name'],
        this.city = json['city'],
        this.imageUrl = json['urlImage'],
        this.isDelete = json['isDelete'];

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'name': this.name,
        'city': this.city,
        'urlImage': this.imageUrl,
        'isDelete': this.isDelete
      };
}
