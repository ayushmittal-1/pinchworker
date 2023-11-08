import 'package:flutter/cupertino.dart';
import 'package:easy_vahan/screens/onboarding/landing.dart';
import 'package:easy_vahan/screens/add_ev/allVehicleList.dart';
import 'package:easy_vahan/screens/testing.dart';
import 'package:easy_vahan/screens/add_ev/carDetailPage.dart';

class RouteName {
  static const landing = "landing";
  static const vehicleList = "vehicleList";
  static const testing = "testing";
}

class Routes {
  static cupertinoRoute(
          String name, Widget Function(BuildContext) widgetProvider) =>
      CupertinoPageRoute(
        settings: RouteSettings(name: name),
        builder: (context) => widgetProvider(context),
      );

  static Route landing() =>
      cupertinoRoute(RouteName.landing, (ctx) => const Landing());

  static Route vehicleList() =>
      cupertinoRoute(RouteName.vehicleList, (ctx) => const Allvehiclelist());

  static Route testing() =>
      cupertinoRoute(RouteName.testing, (ctx) => const Testing());
}
