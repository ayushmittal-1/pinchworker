import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:easy_vahan/screens/onboarding/landing.dart';
import 'package:easy_vahan/common/data_store.dart';
import 'package:easy_vahan/providers/user_info.dart';
import 'package:easy_vahan/app_providers.dart';
import 'package:easy_vahan/common/navigation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  DataStore store = DefaultStore(await SharedPreferences.getInstance());
  UserProv userProv = UserProv(dataStore: store);

  runApp(EasyVahan(
    store: store,
    userProv: userProv,
  ));
}

class EasyVahan extends StatelessWidget {
  DataStore store;
  UserProv userProv;

  EasyVahan({super.key, required this.store, required this.userProv});

  @override
  Widget build(BuildContext context) {
    return AppProviders(
      store: store,
      userProv: userProv,
      child: MaterialApp(
        navigatorKey: NavigationService.navigatorKey,
        title: "Easy Vahan",
        home: const Landing(),
        debugShowCheckedModeBanner: false,
      ),
    );

    // return MaterialApp(
    //   home: Scaffold(
    //     body: Landing(),
    //   ),
    //   debugShowCheckedModeBanner: false,
    // );
  }
}
