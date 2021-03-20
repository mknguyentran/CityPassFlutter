import 'package:flutter_guid/flutter_guid.dart';

class Pass{
  Guid id;
  String name;
  double price;
  bool isSelling;
  double rate;
  var feedback;

   Pass.formJson(Map<String, dynamic> json)
      : this.id = new Guid(json['id']),
        this.name = json['name'],
        this.price = json['price'],
        this.isSelling = json['isSelling'],
        this.rate = json['rate'],
        this.feedback = json['feedbacks'];


  Map<String, dynamic> toJson() => {
        'id': this.id,
        'name': this.name,
        'price': this.price,
        'isSelling': this.isSelling,
        'rate': this.rate,
        
        'feedbacks': this.feedback
      };
}