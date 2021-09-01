
import 'package:drinking_water/models/water.dart';
import 'package:flutter/material.dart';

class WaterState with ChangeNotifier{

  List<Water> _waters = [
    Water(value: 320,date: DateTime.utc(2021,08,26)),
    Water(value: 300,date: DateTime.utc(2021,08,26)),
    Water(value: 350,date: DateTime.utc(2021,08,26)),
    Water(value: 300,date: DateTime.utc(2021,08,26)),
    Water(value: 325,date: DateTime.utc(2021,08,26))
  ];

  List<Water> get waters => _waters;

  Water get currentWater => _waters.first;

  add(Water water){
    _waters.insert(0, water);

    notifyListeners();
  }

}