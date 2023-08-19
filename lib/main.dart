import 'package:easy_vahan/screens/landing.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EasyVahan());
}

class EasyVahan extends StatelessWidget {
  const EasyVahan({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Landing(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

