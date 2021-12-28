import 'package:learning_app/data/core/api_constants.dart';
import 'package:learning_app/l10n/localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:learning_app/utils/snackbar_uils.dart';

Future<Position?> determinePosition() async {
  // bool serviceEnabled;
  LocationPermission permission;

  // Geolocator.getCurrentPosition();
  // // Test if location services are enabled.
  // serviceEnabled = await Geolocator.isLocationServiceEnabled();
  // if (!serviceEnabled) {
  //   showMessage(
  //       title: "Location Service", message: "Please enable location service");
  //   // Location services are not enabled don't continue
  //   // accessing the position and request users of the
  //   // App to enable the location services.
  //   return Future.error('Location services are disabled.');
  // }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      showMessage("Please allow permission to access location");

      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    showMessage("Please allow permission to access location");

    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // // When we reach here, permissions are granted and we can
  // // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}

Future<PickResult?> pickLocationFromMap(BuildContext context) async {
  final currentLocation = await determinePosition();
  if (currentLocation == null) return null;
  final newLocation = await Get.to<PickResult>(() => PlacePicker(
      useCurrentLocation: true,
      onPlacePicked: (pickedPlace) {
        if (pickedPlace.addressComponents!.length > 5) {
          Get.back(result: pickedPlace);
        } else {
          Get.defaultDialog(
            title: AppLocalizations.of(context)!.invalid_address,
            middleText: AppLocalizations.of(context)!
                .please_enter_more_specific_address,
          );
        }
      },
      apiKey: ApiConstants.googleMapKey,
      initialPosition:
          LatLng(currentLocation.latitude, currentLocation.longitude)));
  return newLocation;
}
