import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:easy_vahan/common/data_store.dart';

class CarProv extends ChangeNotifier {
  final DataStore dataStore;

  CarProv({required this.dataStore});

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
}
