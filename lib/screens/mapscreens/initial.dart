import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class InitialMapScreen extends StatefulWidget {
  const InitialMapScreen({Key? key}) : super(key: key);

  @override
  State<InitialMapScreen> createState() => _InitialMapScreenState();
}

class _InitialMapScreenState extends State<InitialMapScreen> {
  static final CameraPosition _kGooglePlex = const CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962),
      zoom: 14.4746
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: GoogleMap(
          initialCameraPosition: _kGooglePlex,
          mapType: MapType.hybrid,
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          scrollGesturesEnabled: true,
        ) ,

      ),
    );
  }
}
