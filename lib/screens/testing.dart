import 'package:easy_vahan/screens/onboarding/login_page.dart';
import 'package:easy_vahan/screens/onboarding/register_page.dart';
import 'package:flutter/material.dart';
import 'package:easy_vahan/common/navigation.dart';
import 'package:easy_vahan/common/routing.dart';
import 'package:easy_vahan/theme/color.dart';

class Testing extends StatelessWidget {
  const Testing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Text(
              "Reached The testing page. Confirm the email and login",
              style: TextStyle(color: textColor),
            ),
            ElevatedButton(
                onPressed: () async {
                  await Navigator.of(
                          NavigationService.navigatorKey.currentContext!,
                          rootNavigator: true)
                      .pushAndRemoveUntil(
                          Routes.landing(), (Route<dynamic> route) => false);
                },
                child: Text(
                  "Continue",
                  style: TextStyle(
                    color: textColor,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
