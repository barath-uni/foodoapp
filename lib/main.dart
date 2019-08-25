import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_food_app/CheckoutWidget.dart';
import 'package:flutter_food_app/homebloc/bloc.dart';
import 'package:flutter_food_app/foodmodel.dart';
import 'homebloc/homebloc_bloc.dart';

void main() => runApp(FoodoApp());

class FoodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'FoodOApp',
      home: BlocProvider<HomeblocBloc>(
        builder:(context) => HomeblocBloc(),
        child: FoodMainWidgetStateless()
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FoodMainWidgetStateless extends StatelessWidget {

  FoodMainWidgetStateless({Key key}) : super(key: key);
  List<String> _foodName = ["Burrito", "Meat Ball"];
  List<String> _foodImage = ["https://images.pexels.com/photos/461198/pexels-photo-461198.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://hips.hearstapps.com/del.h-cdn.co/assets/18/06/1600x800/landscape-1517928338-delish-mongolian-ramen-and-meatballs-still001.jpg?resize=480:*"];
  List<int> _foodPrice = [5,7];
  int total = 0;

  @override
  Widget build(BuildContext context) {
    HomeblocBloc homeblocBloc = BlocProvider.of<HomeblocBloc>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("FoodOApp"),
          actions: <Widget>[
            Container(
              height: 30.0,
              width: 30.0,
              padding: EdgeInsets.fromLTRB(0, 15, 15, 0),

              child: BlocBuilder<HomeblocBloc, HomeblocState>(
                  condition: (previousState, currentState){
                    if(previousState == currentState)
                      {
                        print(previousState);
                        print(currentState);
                        return false;
                      }
                    print(previousState);
                    print(currentState);
                    return true;
                  },
                  builder: (context, state)
                {
                  if(state is HomeBlocAdded)
                    {
                      print(state);
                      ++total;
                      print(total);
                    }
                  else if (state is HomeBlocRemoved){
                    --total;
                    if(total<0)
                      {
                        total=0;
                      }
                  }
                  return Badge(
                  badgeColor: Colors.deepOrangeAccent,
                  toAnimate: true,
                child: IconButton(icon: Icon(Icons.shopping_cart),
                onPressed: (){
                  homeblocBloc.dispatch(HomeBlocLoadEvent());
                Navigator.push(
                context,
                MaterialPageRoute(builder:(context) => CheckoutWidget())
                );
                },),
                badgeContent: Text(total.toString()),
                );
                }
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
                                homeblocBloc.dispatch(HomeBlocAddEvent(
                                    FoodModel(
                                    name:_foodName[count],
                                    price:_foodPrice[count])));
                              }
                          ),
                          FlatButton(
                              child: Icon(Icons.remove, size: 40.0,),
                              onPressed: (){
                                homeblocBloc.dispatch(
                                    HomeBlocRemoveEvent(_foodName[count]));
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

