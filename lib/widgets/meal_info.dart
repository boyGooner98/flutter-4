import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../models/meals.dart';

class MealInfo extends StatefulWidget {
  final Function addToFavs;
  final List<Meal> favMeals;
  MealInfo(this.addToFavs, this.favMeals);

  @override
  _MealInfoState createState() => _MealInfoState();
}

class _MealInfoState extends State<MealInfo> {
  @override
  Widget build(BuildContext context) {
    final routeArguments = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final itemId = routeArguments['id'];
    List<Meal> item = DUMMY_MEALS.where((element) => element.id == itemId).toList();
    Meal itemInfo = item[0];
    bool isFavourite = false;
    if (widget.favMeals.contains(itemInfo)) {
      isFavourite = true;
    }
    return Scaffold(
      floatingActionButton:FloatingActionButton(
          onPressed: () => widget.addToFavs(itemInfo),
          backgroundColor: Theme.of(context).primaryColor,
          hoverColor: Colors.yellow,
          child: Icon(
            isFavourite?Icons.star_border:Icons.star,
            color: Colors.white,
          ),
        ),
      appBar: AppBar(title: Text('Meal Info Screen')),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.yellow[50],
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.network(itemInfo.imageUrl),
              SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                color: Colors.pinkAccent[50],
                child: Column(
                  children: <Widget>[
                    Text(
                      'Ingredients',
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'moderno-bold',
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: 350,
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: itemInfo.ingredients.map((ingredient) {
                                return Container(
                                    margin: const EdgeInsets.only(top: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.yellow[600],
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    width: 340,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(ingredient,
                                          style: TextStyle(
                                            fontSize: 15,
                                          )),
                                    ));
                              }).toList()),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Steps',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'moderno-bold',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(15)),
                  width: 350,
                  height: 300,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.purple,
                                maxRadius: 30,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: FittedBox(
                                      child: Text('# ${(index + 1).toString()}',
                                          style: TextStyle(fontSize: 18, color: Colors.white))),
                                ),
                              ),
                              title: Text(itemInfo.steps[index], style: TextStyle(fontSize: 20)),
                            ),
                            Divider(
                              color: Colors.black,
                            )
                          ],
                        ),
                      );
                    },
                    itemCount: itemInfo.steps.length,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
