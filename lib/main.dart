import 'package:easy_vahan/screens/mapscreens/initial.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {


  runApp(PinchProject(

  ));
}

class PinchProject extends StatelessWidget {


  // PinchProject({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: "Pinch project",
      home: const MapPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
