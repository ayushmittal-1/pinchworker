import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:easy_vahan/common/data_store.dart';
import 'package:easy_vahan/providers/user_info.dart';
import 'package:easy_vahan/screens/onboarding/repo/auth_repo.dart';
import 'package:easy_vahan/screens/onboarding/view_models/login_vm.dart';
import 'package:easy_vahan/screens/onboarding/view_models/register_vm.dart';

class AppProviders extends StatelessWidget {
  final Widget child;
  final DataStore store;
  final UserProv userProv;

  const AppProviders({
    required this.store,
    Key? key,
    required this.child,
    required this.userProv,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      Provider<AuthRepo>(create: (_) => AuthRepo(store: store)),
      ChangeNotifierProvider(create: (_) => userProv),
      ChangeNotifierProvider(
          create: (_) => LoginAuthViewModel(
              myRepo: AuthRepo(store: store), userProvider: userProv)),
      ChangeNotifierProvider(
          create: (_) => RegisterAuthViewModel(
              store: store,
              myRepo: AuthRepo(store: store),
              userProvider: UserProv(dataStore: store))),
    ], child: child);
  }
}
