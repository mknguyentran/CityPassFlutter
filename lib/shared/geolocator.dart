import 'package:geolocator/geolocator.dart';

class GeolocatorUtil {
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      return Future.error('Location permission is denied');
    }

    return await Geolocator.getCurrentPosition();
  }
}
