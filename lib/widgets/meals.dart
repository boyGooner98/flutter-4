import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../models/meals.dart';
import './meal_item.dart';

class Meals extends StatelessWidget {
  List<Meal> meals = DUMMY_MEALS;
  @override
  Widget build(BuildContext context) {
    final routeArguments = ModalRoute.of(context).settings.arguments as Map<String, Object>;
    String id = routeArguments['id'];
    String title = routeArguments['title'];
    final Map<String, bool> filters = routeArguments['filters'];
    final mealsList = DUMMY_MEALS.where((meal) {
      bool isPresent = false;
      if (meal.categories.contains(id)) {
        if (meal.isGlutenFree == filters['isGlutenFree'])
          isPresent = true;
        else if (meal.isVegan == filters['isVegan'])
          isPresent = true;
        else if (meal.isVegetarian == filters['isVegetarian'])
          isPresent = true;
        else if (meal.isLactoseFree == filters['isLactoseFree'])
          isPresent = true;
        else
          return false;
      }
      if (isPresent)
        return true;
      else
        return false;
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: mealsList.map((meal) {
            return MealItem(meal.imageUrl, meal.title, meal.duration, meal.affordability.toString(),
                meal.complexity.toString(), meal.id);
          }).toList(),
        ),
      ),
    );
  }
}
