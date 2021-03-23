import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:location_permissions/location_permissions.dart';

class LocationUtil {
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    PermissionStatus permissionStatus;

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

  Future<List<Placemark>> getCurrentLocations() async {
    List<Placemark> tmp;

    Position currentPosition = await determinePosition();
    tmp = await placemarkFromCoordinates(currentPosition.latitude, currentPosition.longitude);
    return tmp;
  }

  Future<PermissionStatus> getLocationPermission() {
    return LocationPermissions().requestPermissions();
  }
}
