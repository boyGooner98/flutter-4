import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int duration;
  final String affordability;
  final String complexity;
  final String id;
  MealItem(this.imageUrl, this.title, this.duration, this.affordability, this.complexity, this.id);
  void goToMealInfo(BuildContext context) {
    Navigator.of(context).pushNamed('/mealInfo', arguments: {
      'id':id
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => goToMealInfo(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        child: Container(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                    child: Image.network(
                      imageUrl,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 2,
                    child: Container(
                      width: 280,
                      color: Colors.black.withOpacity(0.5),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          title,
                          maxLines: 2,
                          style: TextStyle(fontSize: 25, color: Colors.white),
                          softWrap: true,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                  child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 5,
                      ),
                      Text(duration.toString())
                    ]),
                    Row(children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(
                        width: 5,
                      ),
                      Text(complexity.substring(11))
                    ]),
                    Row(
                      children: <Widget>[
                        Icon(Icons.attach_money),
                        SizedBox(
                          width: 5,
                        ),
                        Text(affordability.substring(14))
                      ],
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
