import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:easy_vahan/models/car.dart';

import 'package:easy_vahan/common/data_store.dart';

class CarProv extends ChangeNotifier {
  final DataStore dataStore;
  int _selected = 0;
  List<CarModel> allCars = [];
  CarModel selectedCar = CarModel();

  CarProv({required this.dataStore});

  int get selected => _selected;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> updateSelected(int newSelected) async {
    _selected = newSelected;
    selectedCar = allCars[_selected];
  }

  dynamic getCar() {
    return selectedCar;
  }
}
