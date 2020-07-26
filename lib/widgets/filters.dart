import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool filter1 = false;
  bool filter2 = false;
  bool filter3 = false;
  bool filter4 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        centerTitle: true,
        actions: <Widget>[
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.save),
              iconSize: 30,
              onPressed: () => {
                Navigator.of(context).popAndPushNamed('/', arguments: {
                  'isGlutenFree': filter1,
                  'isVegan': filter2,
                  'isVegetarian': filter3,
                  'isLactoseFree': filter4,
                })
              },
            ),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.green,
        ),
        margin: const EdgeInsets.all(35),
        height: MediaQuery.of(context).size.height * 0.3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'isGlutenFree',
                      style: TextStyle(fontSize: 19, color: Colors.black, fontFamily: 'moderno-bold'),
                    ),
                    Switch(
                      value: filter1,
                      onChanged: (value) {
                        setState(() {
                          filter1 = value;
                        });
                      },
                      activeColor: Colors.black,
                      inactiveThumbColor: Colors.pink,
                      activeTrackColor: Colors.black,
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'isVegan',
                      style: TextStyle(fontSize: 19, color: Colors.black, fontFamily: 'moderno-bold'),
                    ),
                    Switch(
                      value: filter2,
                      onChanged: (value) {
                        setState(() {
                          filter2 = value;
                        });
                      },
                      activeColor: Colors.black,
                      inactiveThumbColor: Colors.pink,
                      activeTrackColor: Colors.black,
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'isVegetarian',
                      style: TextStyle(fontSize: 19, color: Colors.black, fontFamily: 'moderno-bold'),
                    ),
                    Switch(
                      value: filter3,
                      onChanged: (value) {
                        setState(() {
                          filter3 = value;
                        });
                      },
                      activeColor: Colors.black,
                      inactiveThumbColor: Colors.pink,
                      activeTrackColor: Colors.black,
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'isLactoseFree',
                      style: TextStyle(fontSize: 19, color: Colors.black, fontFamily: 'moderno-bold'),
                    ),
                    Switch(
                      value: filter4,
                      onChanged: (value) {
                        setState(() {
                          filter4 = value;
                        });
                      },
                      activeColor: Colors.black,
                      inactiveThumbColor: Colors.pink,
                      activeTrackColor: Colors.black,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
