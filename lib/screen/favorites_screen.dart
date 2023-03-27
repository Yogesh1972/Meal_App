import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../model/meal.dart';

class Favorites extends StatelessWidget {
  final List<meal> favoriteMeal;

  Favorites(this.favoriteMeal);
  @override
  Widget build(BuildContext context) {
    if (favoriteMeal.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'No transactions added yet!',
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Image.asset(
                'assest/images/fav1.jpeg',
                fit: BoxFit.fitWidth,
              ),
            ),
          ],
        ),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return meal_item(
            id: favoriteMeal[index].id,
            Title: favoriteMeal[index].Name,
            ImageUrl: favoriteMeal[index].ImageUrl,
            affordability: favoriteMeal[index].affordability,
            complexity: favoriteMeal[index].complexity,
            duration: favoriteMeal[index].duration,
          );
        },
        itemCount: favoriteMeal.length,
      );
    }
  }
}
