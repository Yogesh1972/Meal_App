import 'package:flutter/material.dart';
import 'package:meal_app/screen/meal_detail.dart';
import '../model/meal.dart';

class meal_item extends StatelessWidget {
  final String id;
  final String Title;
  final String ImageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  meal_item({
    required this.id,
    required this.Title,
    required this.ImageUrl,
    required this.affordability,
    required this.complexity,
    required this.duration,
  });

  String get comp {
    if (complexity == Complexity.Simple) {
      return 'Simple';
    }
    if (complexity == Complexity.Challenging) {
      return 'Challenging';
    }
    if (complexity == Complexity.Hard) {
      return 'Hard';
    }
    return ("No widget to build");
  }

  String get aff {
    if (affordability == Affordability.Affordable) {
      return 'Affordable';
    }
    if (affordability == Affordability.Pricey) {
      return 'Pricey';
    }
    if (affordability == Affordability.Luxurious) {
      return 'Luxurious';
    }
    return ("No widget to build");
  }

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      MealDetailScreen.routeName,
      arguments: id,
    );
    //  .then((result) => {
    //        if (result != null) {//removeFunction(result)
    //        }
    //      });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Image.network(
                  ImageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 20,
                right: 5,
                child: Container(
                  // decoration:
                  //     BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  width: 280,
                  color: Colors.black45,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    Title,
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.schedule,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      '${duration} min',
                      style: TextStyle(fontWeight: FontWeight.w200),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.work,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      '${comp}',
                      style: TextStyle(fontWeight: FontWeight.w200),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.attach_money,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      '${aff}',
                      style: TextStyle(fontWeight: FontWeight.w200),
                    ),
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
