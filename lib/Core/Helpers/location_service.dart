import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:efaq_elhaya/Core/Utlis/custom_dialog.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart' as loc;

class LocationService {
  final loc.Location _location = loc.Location();

  /// Get user's current location and return formatted address
  Future<Either<String, String>> determinePosition() async {
    try {
      // Ensure location services are enabled
      final bool serviceEnabled = await _ensureLocationService();
      if (!serviceEnabled) return left("Location services are disabled.");

      // Request & validate permission
      final bool hasPermission = await _requestPermission();
      if (!hasPermission) return left("Location permission denied.");

      // Get current position
      final Position position = await Geolocator.getCurrentPosition();

      // Convert coordinates to a readable address
      return _getAddressFromCoordinates(position);
    } catch (e) {
      return left("Error retrieving location: $e");
    }
  }

  /// Ensure location services are enabled
  Future<bool> _ensureLocationService() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await _location.requestService();
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        CustomDialog.locationMsg();
        return false;
      }
    }
    return true;
  }

  /// Request location permissions
  Future<bool> _requestPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.deniedForever) {
      await Geolocator.openLocationSettings();
      return false;
    }
    return permission != LocationPermission.denied;
  }

  /// Get address from latitude & longitude
  Future<Either<String, String>> _getAddressFromCoordinates(
      Position position) async {
    try {
      final List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      if (placemarks.isEmpty) return left("No address found.");

      final place = placemarks.first;
      final String currentPlace =
          "${place.administrativeArea} - ${place.subAdministrativeArea} - ${place.street}";

      log("Current Location: $currentPlace");
      return right(currentPlace);
    } catch (e) {
      return left("Error retrieving address: $e");
    }
  }

  /// Request to enable location services
  Future<void> enableLocation() async {
    await _location.requestService();
  }
}
