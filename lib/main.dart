import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:flutter_food_app/CheckoutWidget.dart';
import 'package:flutter_food_app/storeData.dart';

void main() => runApp(FoodoApp());

class FoodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'FoodOApp',
      home: FoodMainWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FoodMainWidget extends StatefulWidget {
  FoodMainWidget({Key key}) : super(key: key);

  @override
  _FoodMainWidgetState createState() => _FoodMainWidgetState();
}


class _FoodMainWidgetState extends State<FoodMainWidget> {

  @override
  void initState() {
    super.initState();
  }

  StoreData storeData = StoreData();
  int _cartBadge = 0;

  void addToCart(String foodName, int foodPrice)
  {
    print("Inside add to cart");
    /*Method to add the item to cart*/
    storeData.storeFoodDetails(foodName, foodPrice);
    setState(() {
      ++_cartBadge;
    });
  }

  void removeFromCart(String foodName)
  {
    storeData.removeFoodDetails(foodName);
    setState(() {
      if(_cartBadge >0)
        {
          --_cartBadge;
        }
    });
  }
  List<String> _foodName = ["Burrito", "Meat Ball"];
  List<String> _foodImage = ["https://images.pexels.com/photos/461198/pexels-photo-461198.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
  "https://hips.hearstapps.com/del.h-cdn.co/assets/18/06/1600x800/landscape-1517928338-delish-mongolian-ramen-and-meatballs-still001.jpg?resize=480:*"];
  List<int> _foodPrice = [5,7];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("FoodOApp"),
          actions: <Widget>[
            Container(
              height: 30.0,
              width: 30.0,
              padding: EdgeInsets.fromLTRB(0, 15, 15, 0),

              child: Badge(
                badgeColor: Colors.deepOrangeAccent,
                toAnimate: true,
                child: IconButton(icon: Icon(Icons.shopping_cart),
                  onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder:(context) => CheckoutWidget())
                  );
                  },),
                badgeContent: Text(_cartBadge.toString()),
              ),

            )
          ],
        ),
        body: Center(
          child: ListView.builder(
            itemCount: _foodName.length,
              itemBuilder: (BuildContext context, int count)
          {
              return Card(
                elevation: 26.0,
                color: Colors.white70,
                child: Column(
                  children: <Widget>[
                    Image.network(_foodImage[count]),
                    Row(
                      children: <Widget>[
                        Spacer(flex:2),
                        Text("Name: "+_foodName[count], style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 20.0),),
                        Spacer(),
                        Text("Price: "+_foodPrice[count].toString()+"\$",  style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 20.0)),
                        Spacer(flex: 2,),
                      ],
                    ),
                    ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: Icon(Icons.add, size: 40.0,),
                          onPressed: (){
                            print("Press");
                            addToCart(_foodName[count], _foodPrice[count]);
                          }
                        ),
                        FlatButton(
                          child: Icon(Icons.remove, size: 40.0,),
                          onPressed: (){
                            removeFromCart(_foodName[count]);
                          }
                        )
                      ],
                    )
                  ],
                ),

              );
          }),
        )

    );
  }
}
