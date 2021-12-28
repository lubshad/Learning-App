import 'package:learning_app/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'google_map_my_location.dart';

class GoogleMapWithChangeLocation extends StatelessWidget {
  const GoogleMapWithChangeLocation({
    Key? key,
    required this.location,
    required this.changeLocation,
  }) : super(key: key);

  final LatLng? location;
  final VoidCallback changeLocation;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: location != null
            ? AspectRatio(
                aspectRatio: 1.5,
                child: Stack(
                  children: [
                    GoogleMapMyLocation(
                        location: location!, onTap: changeLocation),
                    Positioned(
                      top: defaultPadding * .5,
                      left: defaultPadding / 2,
                      child: ElevatedButton(
                          onPressed: () => changeLocation(),
                          child: const Text("Change")),
                    ),
                  ],
                ),
              )
            : const SizedBox.shrink());
  }
}
