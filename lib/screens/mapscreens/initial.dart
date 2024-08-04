import 'dart:async';


import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../datscreen.dart';
import 'apikey.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Location _locationController = new Location();

  final Completer<GoogleMapController> _mapController =
  Completer<GoogleMapController>();


  // static const LatLng _charger1 = LatLng(26.8416, 75.8014);
  // static const LatLng _charger2 = LatLng(26.8598, 75.7644);
  // static const LatLng _charger3 = LatLng(26.9048 , 75.7489);
  LatLng? _currentP = null;


  Map<PolylineId, Polyline> polylines = {};

  @override
  void initState() {
    super.initState();
    getLocationUpdates().then(
          (_) => {
        getPolylinePoints().then((coordinates) => {
          generatePolyLineFromPoints(coordinates),
        }),
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: Center(child: Text('Pinch',style: TextStyle(color: Colors.white),)),
            backgroundColor: Colors.orange,
          ),
          body: _currentP == null
              ? const Center(
            child: Text("Loading..."),
          )
              : GoogleMap(
            onMapCreated: ((GoogleMapController controller) =>
                _mapController.complete(controller)),
            initialCameraPosition: CameraPosition(
              target: _currentP!,
              zoom: 50,
            ),
            markers: {
              Marker(
                markerId: MarkerId("_currentLocation"),
                icon: BitmapDescriptor.defaultMarker,
                position: _currentP!,
              ),
              // Marker(
              //     markerId: MarkerId("_sourceLocation"),
              //     icon: BitmapDescriptor.defaultMarkerWithHue(35),
              //     position: _currentP!),
              // Marker(
              //     markerId: MarkerId("_destionationLocation"),
              //     icon: BitmapDescriptor.defaultMarkerWithHue(35),
              //     position: _currentP!),
              // Marker(
              //     markerId: MarkerId("_charger3"),
              //     icon: BitmapDescriptor.defaultMarkerWithHue(35),
              //     position: _charger3)
            },
            polylines: Set<Polyline>.of(polylines.values),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onLongPress: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DataScreen()),
                      // remove all previous routes
                    );

                  },
                  onPressed: () {
                    print("check in");
                    savepostime();
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.orange, // Text color
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 5, 
                  ),
                  child: Text('Check in'),
                ),
                SizedBox(width: 10,),
                ElevatedButton(
                onLongPress: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DataScreen()),
                        // remove all previous routes
                  );

                },  
                  onPressed: () {
                    print("check out");
                    savepostime2();
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.redAccent, // Text color
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 5, 
                  ),
                  child: Text('Check Out'),
                ),

              ],
            ),
            SizedBox(height: 25,)
          ],
        ),
      ],
    );
  }

  Future<void> _cameraToPosition(LatLng pos) async {
    final GoogleMapController controller = await _mapController.future;
    CameraPosition _newCameraPosition = CameraPosition(
      target: pos,
      zoom: 17,
    );
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(_newCameraPosition),
    );
  }

  Future<void> getLocationUpdates() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await _locationController.serviceEnabled();
    if (_serviceEnabled) {
      _serviceEnabled = await _locationController.requestService();
    } else {
      return;
    }

    _permissionGranted = await _locationController.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _locationController.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationController.onLocationChanged
        .listen((LocationData currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        setState(() {
          _currentP =
              LatLng(currentLocation.latitude!, currentLocation.longitude!);
          _cameraToPosition(_currentP!);
        });
      }
    });
  }

  Future<List<LatLng>> getPolylinePoints() async {
    List<LatLng> polylineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      GOOGLE_MAPS_API_KEY,
      PointLatLng(_currentP!.latitude, _currentP!.longitude),
      PointLatLng(_currentP!.latitude, _currentP!.longitude),

      travelMode: TravelMode.driving,
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }
    return polylineCoordinates;
  }


  void generatePolyLineFromPoints(List<LatLng> polylineCoordinates) async {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id,
        color: Colors.purpleAccent,
        points: polylineCoordinates,
        width: 3);
    setState(() {
      polylines[id] = polyline;
    });
  }


  Future<void> savepostime() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog( // AlertDialog starts here
          title: Text('Success'),
          content: Text( 'Checkin saved!' ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        ); // AlertDialog ends here
      },
    );
    DateTime now = DateTime.now(); // Current local time
    DateTime utcTime = now.toUtc(); // Convert to UTC
    DateTime istTime = utcTime.add(Duration(hours: 5, minutes: 30)); // Add IST offset

    print("Current IST time: ${istTime.toIso8601String()}");
    print("Current position of worker: ${_currentP.toString()}");

    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('positionofworker', _currentP.toString());
    await prefs.setString('dateandtime', istTime.toIso8601String());


  }
  Future<void> savepostime2() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog( // AlertDialog starts here
          title: Text('Success'),
          content: Text( 'Checkout saved!' ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        ); // AlertDialog ends here
      },
    );
    DateTime now = DateTime.now(); // Current local time
    DateTime utcTime = now.toUtc(); // Convert to UTC
    DateTime istTime = utcTime.add(Duration(hours: 5, minutes: 30)); // Add IST offset

    print("Current IST time: ${istTime.toIso8601String()}");
    print("Current position of worker: ${_currentP.toString()}");

    SharedPreferences prefs2 = await SharedPreferences.getInstance();

    await prefs2.setString('positionofworkercheckout', _currentP.toString());
    await prefs2.setString('dateandtimecheckout', istTime.toIso8601String());


  }


// Future<List<LatLng>> getPolylinePoints002() async {
  //   List<LatLng> polylineCoordinates = [];
  //   PolylinePoints polylinePoints = PolylinePoints();
  //   PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
  //     GOOGLE_MAPS_API_KEY,
  //     PointLatLng(_charger2.latitude, _charger2.longitude),
  //     PointLatLng(_charger3.latitude, _charger3.longitude),
  //
  //     travelMode: TravelMode.driving,
  //   );
  //   if (result.points.isNotEmpty) {
  //     result.points.forEach((PointLatLng point) {
  //       polylineCoordinates.add(LatLng(point.latitude, point.longitude));
  //     });
  //   } else {
  //     print(result.errorMessage);
  //   }
  //   return polylineCoordinates;
  // }

  // void generatePolyLineFromPoints002(List<LatLng> polylineCoordinates) async {
  //   PolylineId id = PolylineId("poly002");
  //   Polyline polyline = Polyline(
  //       polylineId: id,
  //       color: Colors.purpleAccent,
  //       points: polylineCoordinates,
  //       width: 3);
  //   setState(() {
  //     polylines[id] = polyline;
  //   });
  // }
}
