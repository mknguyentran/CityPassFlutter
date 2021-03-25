import 'package:geocoding/geocoding.dart' hide Location;
import 'package:location/location.dart';

class LocationUtil {
  Location location = new Location();

  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  Future<LocationData> _getCurrentLocationData() async {
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    if(_permissionGranted == PermissionStatus.granted) {
      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          return null;
        }
      }
    }

    _locationData = await location.getLocation();
    
    return _locationData;
  }

  Future<List<Placemark>> getCurrentLocationMarks() async {
    List<Placemark> listPlaceMarks;

    LocationData locationData = await _getCurrentLocationData();
    if (locationData != null)
      listPlaceMarks = await placemarkFromCoordinates(locationData.latitude, locationData.longitude, localeIdentifier: 'vi_VN');
    return listPlaceMarks;
  }
}
