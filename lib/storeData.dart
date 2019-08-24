import 'dart:core';

import 'package:flutter/material.dart';

class StoreData {
//  Acts as a db to store the food name and price

  StoreData._privateConstructor();
  static final StoreData _instance = StoreData._privateConstructor();

  factory StoreData()
  {
    return _instance;
  }

  Map<String, int> _foodNamePrice = Map<String, int>();

  void storeFoodDetails(String foodName, int foodPrice)
  {
    print(foodName);
    print(foodPrice);
//    Store it as a key value pair
  _foodNamePrice[foodName] = foodPrice;
  print(_foodNamePrice);
  }

  void removeFoodDetails(String foodName)
  {
    print("Remove food");
    _foodNamePrice.remove(foodName);
    print(_foodNamePrice);
  }

  Map<String, int> retrieveFoodDetails()
  {
    print(_foodNamePrice);
    return _foodNamePrice;
  }
}