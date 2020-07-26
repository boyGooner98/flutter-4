import 'package:flutter/material.dart';
import './widgets/filters.dart';
import './widgets/meals.dart';
import './widgets/meal_info.dart';
import './widgets/bottom_navigator.dart';
import './models/meals.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _favMeals = [];

  void addToFavs(Meal item) {
    int index = _favMeals.indexWhere((meal) => meal.id == item.id);
    if (index == -1) {
      setState(() {
        _favMeals.add(item);
      });
      print('item added to Favs');

    } else {
      setState(() {
        _favMeals.removeAt(index);
      });
      print('item removed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'moderno-medium',
          primaryColor: Colors.indigo[900],
          accentColor: Colors.orangeAccent,
          appBarTheme: AppBarTheme(
              textTheme: TextTheme(
                  headline1: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontFamily: 'moderno-bold',
          )))),
      routes: {
        '/': (ctx) => BottomNavigator(_favMeals),
        '/meals': (ctx) => Meals(),
        '/mealInfo': (ctx) => MealInfo(addToFavs,_favMeals),
        '/filtersScreen': (ctx) => FilterScreen(),
      },
    );
  }
}
