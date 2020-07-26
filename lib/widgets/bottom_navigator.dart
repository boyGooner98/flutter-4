import 'package:flutter/material.dart';
import './meal_categories.dart';
import 'favourites.dart';
import './drawer.dart';
import '../models/meals.dart';

class BottomNavigator extends StatefulWidget {
  final List<Meal> favMeals;
  BottomNavigator(this.favMeals);
  @override
  _BottomNavigatorState createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  List<Widget> _pages;
  int selectedIndex = 0;
  void _selectedPage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void initState() {
    _pages =  [
    CategoriesScreen(),
    Favourites(widget.favMeals),
  ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Jo\'s Deli',
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'moderno-bold',
          ),
        ),
        centerTitle: true,
      ),
      drawer: DrawerMain(),
      body: _pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.cyan[700],
        currentIndex: selectedIndex,
        onTap: _selectedPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Meals'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favourites'),
          ),
        ],
      ),
    );
  }
}
