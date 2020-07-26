import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import './meal_category.dart';

class CategoriesScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView(
          children: [
            ...DUMMY_CATEGORIES.map((cat) {
              return MealCategory(cat.id, cat.title, cat.color);
            }).toList(),
          ],
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
        ),
      ),
    );
  }
}
