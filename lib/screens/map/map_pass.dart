import 'package:city_pass/constants.dart';
import 'package:city_pass/models/ticketTypeDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapForPass extends StatelessWidget {
  final List listLocations;

  MapForPass(this.listLocations);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(listLocations[0][0][2], listLocations[0][0][3]),
          zoom: 11.0
        ),
        markers: generateMapMarkers(),
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
    );
  }

  Set<Marker> generateMapMarkers() {
    Set<Marker> markers = new Set();

    for (int i = 0; i < listLocations.length; i++) {
      for (int y = 0; y < listLocations[i].length - 1; y++) {
        markers.add(Marker(
          markerId: MarkerId(listLocations[i][y][0]),
          position: LatLng(listLocations[i][y][2], listLocations[i][y][3]),
          infoWindow: InfoWindow(
            title: listLocations[i][y][1]
          )
        ));
      }
    }

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
