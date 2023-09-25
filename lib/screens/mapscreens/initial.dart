import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class InitialMapScreen extends StatefulWidget {
  const InitialMapScreen({Key? key}) : super(key: key);

  @override
  State<InitialMapScreen> createState() => _InitialMapScreenState();
}

class _InitialMapScreenState extends State<InitialMapScreen> {
  static final CameraPosition _kGooglePlex = const CameraPosition(
      target: LatLng(26.920980, 75.794220),
      zoom: 14.4746
  );
  //trash static lat lang
  // ***************************
  static const LatLng source = LatLng(26.9210,75.794220);
  static const LatLng destination = LatLng(26.9210,75.8227);
  //******************************



  List<LatLng> polylineCoordinates = [];

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    Future<PolylineResult> result = polylinePoints.getRouteBetweenCoordinates(
        "AIzaSyA09JczA-nGgEFjLCYKblZImme8hxLRRXM",
        PointLatLng(source.latitude, source.longitude),
        PointLatLng(destination.latitude, destination.longitude)
    );

    // if(result.points.isNotEmpty) {
    //   result.points.forEach(PointLatLng point) => polylineCoordinates.
    // }
    

  }
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
          markers: {
            Marker(markerId: MarkerId("source"),
            position: LatLng(26.9210,75.794220),
            ),
            Marker(markerId: MarkerId("destination"),
              position: LatLng(26.9210,75.8227),
            )
        }
        ) ,

      ),
    );
  }
}
