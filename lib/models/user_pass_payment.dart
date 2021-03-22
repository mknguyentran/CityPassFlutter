import 'package:flutter_guid/flutter_guid.dart';

class UserPassPayment {
  String userUid;
  int quantiyChildren;
  int quantiyAdult;
  // Guid passId;
  String passId;
  List<dynamic> ticketTypeIds;

  String toStringDetail() {
    String s = "";

    s += userUid +
        "-" +
        quantiyChildren.toString() +
        "-" +
        quantiyAdult.toString() +
        "-" +
        passId.toString() +
        "\n";
    for (int i = 0; i < ticketTypeIds.length; i++) {
      s += ticketTypeIds[i].toString() + "\n";
    }
    return s;
  }

  Map<String, dynamic> toJson() => {
        'userUid': this.userUid,
        'quantiyChildren': this.quantiyChildren,
        'quantiyAdult': this.quantiyAdult,
        'passId': this.passId,
        'ticketTypeIds': this.ticketTypeIds,
      };

  formJson(Map<String, dynamic> json) {
    this.userUid = json['userUid'];
    this.quantiyChildren = json['quantiyChildren'];
    this.quantiyAdult = json['quantiyAdult'];
    this.passId = json['passId'];
    this.ticketTypeIds = json['ticketTypeIds'];
  }
}
