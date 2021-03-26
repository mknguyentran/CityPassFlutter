import 'package:city_pass/constants.dart';
import 'package:city_pass/models/ticketTypeDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapForTicketType extends StatelessWidget {
  final TicketTypeDetail activity;

  MapForTicketType(this.activity);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(activity.latitude, activity.longitude),
          zoom: 11.0
        ),
        markers: generateMapMarkers(),
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
    );
  }

  Set<Marker> generateMapMarkers() {
    Marker currentLocation = Marker(
      markerId: MarkerId(activity.id.toString()),
      position: LatLng(activity.latitude, activity.longitude),
      infoWindow: InfoWindow(
        title: activity.attractionName,
        snippet: activity.address,
      )
    );

    Set<Marker> markers = new Set();
    markers.add(currentLocation);
    return markers;
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: primaryDarkColor,
      brightness: Brightness.dark,
      leading: IconButton(
        icon: Icon(
          Icons.chevron_left_rounded,
          size: 30,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      title: Text("Bản đồ"),
    );
  }
}