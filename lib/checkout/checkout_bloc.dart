import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_food_app/checkout/checkout_event.dart';
import 'package:flutter_food_app/checkout/checkout_state.dart';
import 'package:flutter_food_app/storeData.dart';
import './bloc.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  StoreData _storeData = StoreData();
  @override
  CheckoutState get initialState => LoadingCheckoutState();

  @override
  Stream<CheckoutState> mapEventToState(
    CheckoutEvent event,
  ) async* {

    if(event is LoadItemsEvent)
      {
        yield* _mapLoadEventToState(event);
      }
  }

  Stream<CheckoutState> _mapLoadEventToState(event)
  async*{
    yield LoadingCheckoutState();
//    Load all the items from the StoreData class and place it in the Map

  Map<String, int> items = _storeData.retrieveFoodDetails();
  Map<String, int> foodItems = Map<String, int>();
  items.forEach((k,v)=>foodItems[k]=v);
  yield ItemsLoadedState(foodNamePrice:foodItems);
  }
}
