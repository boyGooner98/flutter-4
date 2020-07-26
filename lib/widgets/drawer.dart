import 'package:flutter/material.dart';

class DrawerMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: Drawer( 
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              color: Colors.orange,
              width: double.infinity,
              child: Center(
                child: Text('Cooking Up!!',
                    style: TextStyle(
                      fontSize: 35,
                      fontFamily: 'moderno-bold',
                    )),
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.purple,
              height: MediaQuery.of(context).size.height * 0.7,
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.purple,
                    child: ListTile(
                      leading: Icon(
                        Icons.restaurant,
                        color: Colors.white,
                      ),
                      title: Text(
                        'Meals',
                        style: TextStyle(fontSize: 24, fontFamily: 'moderno-bold', color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: Colors.purple,
                    child: ListTile(
                      leading: Icon(Icons.settings, color: Colors.white),
                      title: Text(
                        'Filter',
                        style: TextStyle(fontSize: 24, fontFamily: 'moderno-bold', color: Colors.white),
                      ),
                      onTap: () => Navigator.of(context).pushNamed('/filtersScreen'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
