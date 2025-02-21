import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:efaq_elhaya/Core/Utlis/custom_dialog.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart' as loc;

class LocationService {
  loc.Location location = loc.Location();

  Future<Either<String, String>> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    try {
      // Test if location services are enabled.
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        await location.requestService();
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          CustomDialog.locationMsg();
        }
      }

      if (permission == LocationPermission.deniedForever) {
        CustomDialog.locationMsg();
      }

      Position position = await Geolocator.getCurrentPosition();
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      log(placemarks.first.toJson().toString());
      final place = placemarks.first;
      String currentPlace =
          "${place.administrativeArea}-${place.subAdministrativeArea}-${place.street} ";
      return right(currentPlace);
    } catch (e) {
      return left(e.toString());
    }
  }
}
