import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:flutter_food_app/foodmodel.dart';

@immutable
abstract class HomeblocEvent extends Equatable{
  HomeblocEvent([List props = const []]) : super(props);
}

class HomeBlocLoadEvent extends HomeblocEvent{

  HomeBlocLoadEvent([List props = const[]]) : super(props);

  @override
  String toString() {
    // TODO: implement toString
    return 'HomeBlocLoadEvent';
  }
}

class HomeBlocAddEvent extends HomeblocEvent {

  final FoodModel food;

  HomeBlocAddEvent(this.food) : super([food]);

  @override
  String toString() => 'HomeBlocAddEvent{food: $food}';

}

class HomeBlocRemoveEvent extends HomeblocEvent {

  final String food;

  HomeBlocRemoveEvent(this.food): super([food]);

  @override
  String toString() => 'HomeBlocRemoveEvent {food: $food}';

}