import 'package:easy_vahan/screens/onboarding/login_page.dart';
import 'package:easy_vahan/screens/onboarding/register_page.dart';
import 'package:flutter/material.dart';

class Testing extends StatelessWidget {
  const Testing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Text("Reached The testing page"),
      ),
    );
  }
}
