
import 'package:city_pass/service/api.services.dart';
import 'package:city_pass/service/ticketType.dart';
import 'package:flutter/material.dart';

class RealActivities  extends StatefulWidget {

 
  @override
  _RealActivitiesState createState() => _RealActivitiesState();
}

class _RealActivitiesState extends State<RealActivities> {
   List<TicketType> listRealActivitiesNearYou_3;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      
      List<TicketType> values =
          await Api().getAllTicketTypes(onError: (msg) {
            
            print("Mistake: " + msg);
          });
      listRealActivitiesNearYou_3 = values;
    });
    
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}

