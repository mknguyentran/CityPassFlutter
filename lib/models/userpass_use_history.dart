class UserPassHistory {
  DateTime expiredTime;
  List<dynamic> ticketUsed;
  List<dynamic> ticketInUse;
  List<dynamic> usedList = [] ;
  List<dynamic> unusedList = [];
  

  UserPassHistory.formJson(Map<String, dynamic> json)
      : this.expiredTime = DateTime.parse(json['willExpireAt']),
        this.ticketUsed = json['ticketUsed'],
        this.ticketInUse = json['ticketInUse'] {
    for (int i = 0; i < ticketUsed.length; i++) {
      DateTime usedAt = DateTime.parse(ticketUsed[i]["usedAt"]);
      usedAt = usedAt.add(Duration(hours: 7));
      String name = ticketUsed[i]['ticketTypeName'];
      String ticketTypeID = ticketUsed[i]['ticketTypeId'];
      Object detailUsed = {"id":ticketTypeID, "name":name, "usedAt":usedAt};
      usedList.add(detailUsed);
    }
    for (int i = 0; i < ticketInUse.length; i++) {
   
      // DateTime usedAt = DateTime.parse(ticketInUse[i]["usedAt"]);
      String name = ticketInUse[i]['ticketTypeName'];
      String ticketTypeID = ticketInUse[i]['ticketTypeId'];
      Object detailUnused = {"id":ticketTypeID, "name":name, "usedAt":null};
      unusedList.add(detailUnused);
    }
  }
}
