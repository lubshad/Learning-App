import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapMyLocation extends StatelessWidget {
  const GoogleMapMyLocation({
    Key? key,
    required this.location,
    required this.onTap,
  }) : super(key: key);

  final LatLng location;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      markers: {
        Marker(
            markerId: MarkerId(location.latitude.toString()),
            position: location),
      },
      onTap: (latlng) => onTap(),
      myLocationEnabled: true,
      initialCameraPosition: CameraPosition(target: location, zoom: 12),
    );
  }
}
