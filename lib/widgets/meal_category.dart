import 'package:flutter/material.dart';

class MealCategory extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  MealCategory(this.id, this.title, this.color);

  void navigateToMeals(BuildContext context, Map<String, bool> filters) {
    Navigator.of(context).pushNamed('/meals', arguments: {
      'id': id,
      'title': title,
      'filters': filters,
    });
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments;
    final filters = routeArgs != null
        ? routeArgs as Map<String, bool>
        : {
            'isGlutenFree': false,
            'isVegan': false,
            'isVegetarian': false,
            'isLactoseFree': false,
          };
    return InkWell(
      borderRadius: BorderRadius.circular(5),
      splashColor: Theme.of(context).primaryColor,
      onTap: () => navigateToMeals(context, filters),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [color.withOpacity(0.5), color],
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            fontFamily: 'moderno-medium',
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
