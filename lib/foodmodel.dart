import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class FoodModel extends Equatable {
  final String name;
  final int price;

  FoodModel({this.name,
    this.price}) : super([name, price]);

  @override
  String toString() {
    return 'FoodModel { name: $name, price: $price }';
  }

}