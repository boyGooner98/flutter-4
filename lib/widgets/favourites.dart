import 'package:flutter/material.dart';
import '../models/meals.dart';
import './meal_item.dart';

class Favourites extends StatelessWidget {
  final List<Meal> favMeals;
  Favourites(this.favMeals);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: favMeals.map((meal) {
          return MealItem(meal.imageUrl, meal.title, meal.duration, meal.affordability.toString(),
              meal.complexity.toString(), meal.id);
        }).toList(),
      ),
    );
  }
}
