import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_food_app/checkout/checkout_bloc.dart';
import 'package:flutter_food_app/storeData.dart';

import 'checkout/checkout_event.dart';
import 'checkout/checkout_state.dart';


class CheckoutWidget extends StatelessWidget {
  CheckoutWidget({Key key}) : super(key: key);

  @override
  _CheckoutWidgetState createState() => _CheckoutWidgetState();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProvider<CheckoutBloc>(
      builder: (context)=> CheckoutBloc(),
      child: _CheckoutWidgetState(),
    );
  }
}


class _CheckoutWidgetState extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    int total = 0;
    CheckoutBloc _checkoutBloc = BlocProvider.of<CheckoutBloc>(context);
    _checkoutBloc.dispatch(LoadItemsEvent());
    Map<String, int> _foodNamePrice = Map<String,int>();
    return BlocBuilder<CheckoutBloc, CheckoutState>(
      builder: (context, state){
        if(state is ItemsLoadedState) {
          print(state.foodNamePrice);
          _foodNamePrice = state.foodNamePrice;
          _foodNamePrice.forEach((k,v)=>total=total+v);
        }
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                      itemCount: _foodNamePrice.keys.length,
                      itemBuilder: (BuildContext context, int count)
                      {
                        String key = _foodNamePrice.keys.elementAt(count);

                        return Card(
                          child: Column(
                              children:[
                                Text("Item Name: "+key, style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 21.0),),
                                Text("Price: "+_foodNamePrice[key].toString()+"\$", style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 21.0))
                              ]
                          ),
                        );
                      }),
                ),
                ListTile(
                  title: Text("Total Price"),
                  subtitle: Text(total.toString()+"\$"),
                )
              ],
            ),
          ),
        );
      },
    );

    // TODO: implement build

  }
}