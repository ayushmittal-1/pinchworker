import 'dart:async';

import 'package:easy_vahan/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class InitialMapScreen extends StatefulWidget {
  const InitialMapScreen({Key? key}) : super(key: key);

  @override
  State<InitialMapScreen> createState() => _InitialMapScreenState();
}

class _InitialMapScreenState extends State<InitialMapScreen> {

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = const CameraPosition(
      target: LatLng(26.920980, 75.794220),
      zoom: 14.4746
  );


  //trash static lat lang
  // ***************************
  static const LatLng source = LatLng(26.9210,75.794220);
  static const LatLng destination = LatLng(26.9210,75.8227);
  //******************************
  final Set<Marker> _markers = {};
  final Set<Polyline> _polyline = {};
  List<LatLng> latlng = [
    source,
    destination,

  ];


@override
void initstate(){
  super.initState();
  for(int i=0;i<latlng.length;i++){
    _markers.add(
      Marker(
          markerId: MarkerId(i.toString()),
          position: latlng[i],
          infoWindow: InfoWindow(
            title: 'RanLoc1',
              snippet: 'no1',

          ),
        icon: BitmapDescriptor.defaultMarker,


      )
    );
    setState(() {

    });
    _polyline.add(
        Polyline(polylineId: PolylineId('0001'),
            points: latlng
        )
    );
    
  }

}


  //

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
          markers: _markers,
          polylines: _polyline,
        ) ,

      ),
    );
  }
}
