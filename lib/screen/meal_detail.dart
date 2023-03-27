import 'package:flutter/material.dart';
import 'package:meal_app/model/meal.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  final Function toggleFav;
  final Function IsFav;

  MealDetailScreen(this.toggleFav, this.IsFav);

  Widget buildTitle(BuildContext, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 22,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildList(BuildContext, child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 160,
      width: double.maxFinite,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final meal_id = ModalRoute.of(context)!.settings.arguments;
    final selectedmeal = DUMMY_MEALS.firstWhere((meal) => meal.id == meal_id);

    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedmeal.Name}'),
        // actions: [
        //   IconButton(
        //     onPressed: toggleFav(meal_id),
        //     icon: Icon(
        //         IsFav(meal_id) ? (Icons.favorite) : Icons.star_border_outlined),
        //   )
        // ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(selectedmeal.ImageUrl, fit: BoxFit.cover),
            ),
            buildTitle(context, 'Ingredients'),
            buildList(
              context,
              ListView.builder(
                itemBuilder: ((context, index) => Card(
                      color: Colors.amber.shade300,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Text(selectedmeal.ingredients[index]),
                      ),
                    )),
                itemCount: selectedmeal.ingredients.length,
              ),
            ),
            buildTitle(context, 'Steps'),
            buildList(
              context,
              (ListView.builder(
                itemBuilder: ((context, index) => Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text(
                              '# ${(index + 1)}',
                            ),
                          ),
                          title: Text(selectedmeal.steps[index]),
                        ),
                        Divider(
                          thickness: 1,
                        )
                      ],
                    )),
                itemCount: selectedmeal.steps.length,
              )),
            )
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.delete),
      //   hoverColor: Colors.red,
      //   onPressed: () {
      //     Navigator.of(context).pop(meal_id);
      //   },
      // ),
      floatingActionButton: FloatingActionButton(
          child: Icon(IsFav(meal_id) ? Icons.star : Icons.star_border),
          hoverColor: Colors.red,
          onPressed: () => toggleFav(meal_id)),
    );
  }
}
