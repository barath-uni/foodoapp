import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:flutter_food_app/foodmodel.dart';

@immutable
abstract class HomeblocState extends Equatable{
  HomeblocState([List props = const []]) : super(props);
}

class HomeBlocStateLoading extends HomeblocState {

  @override
  String toString() => 'HomeBlocStateLoading';
}

class HomeBlocAdded extends HomeblocState {

  @override
  String toString() => 'HomeBlocStateAdded';
}

class HomeBlocRemoved extends HomeblocState {

  @override
  String toString() => 'HomeBlocStateRemoved';
}