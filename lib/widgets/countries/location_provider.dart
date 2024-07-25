import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationProvider with ChangeNotifier {
  Position? _currentPosition;
  String? _currentCountryName;

  Position? get currentPosition => _currentPosition;
  String? get currentCountryName => _currentCountryName;

  Future<void> getCurrentLocation() async {
    try {
      _currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      notifyListeners();

      List<Placemark> placemarks = await placemarkFromCoordinates(
        _currentPosition!.latitude,
        _currentPosition!.longitude,
      );

      if (placemarks.isNotEmpty) {
        _currentCountryName = placemarks.first.country;
        print("Detected country: $_currentCountryName");
        notifyListeners();
      }
    } catch (e) {
      print("Error getting location: $e");
    }
  }
}
