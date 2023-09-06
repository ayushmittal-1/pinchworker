import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:easy_vahan/models/user.dart';
import 'package:easy_vahan/screens/onboarding/repo/auth_repo.dart';

import 'package:easy_vahan/common/data_store.dart';

class UserProv extends ChangeNotifier {
  final DataStore dataStore;

  bool _isLoggedIn = false;
  UserModel currUser = UserModel();

  UserProv({required this.dataStore});

  bool get isLoggedIn => _isLoggedIn;

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> updatePushToken() async {
    await _firebaseFirestore
        .collection('users')
        .doc(currUser.uid)
        .update({'pushToken': currUser.pushToken});
  }

  void updateUserInfo(UserModel userModel) async {
    _isLoggedIn = true;

    currUser = userModel;
    await dataStore.setString("loggedIn", 'true');
    await dataStore.setString('uid', currUser.uid.toString());

    notifyListeners();
  }

  dynamic getUserInfo() {
    return currUser;
  }
}
