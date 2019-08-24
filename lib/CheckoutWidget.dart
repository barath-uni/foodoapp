import 'package:flutter/material.dart';
import 'package:flutter_food_app/storeData.dart';


class CheckoutWidget extends StatefulWidget {
  CheckoutWidget({Key key}) : super(key: key);

  @override
  _CheckoutWidgetState createState() => _CheckoutWidgetState();
}


class _CheckoutWidgetState extends State<CheckoutWidget> {

  @override
  void initState() {
    super.initState();
  }
  int total = 0;
  StoreData storeData = StoreData();
  void updateTotal()
  { Map<String, int> foodDetails = storeData.retrieveFoodDetails();
  setState(() {
    foodDetails.forEach((k,v)=>total=total+v);
  });
  }
  @override
  Widget build(BuildContext context) {
    Map<String, int> _foodNamePrice = storeData.retrieveFoodDetails();
    updateTotal();
    // TODO: implement build
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
  }
}