import 'package:flutter/material.dart';
import 'package:meal_app/screen/filter.dart';

class Drawer_Main extends StatelessWidget {
  const Drawer_Main({super.key});

  @override
  Widget build(BuildContext context) {
    Widget Drawer_Listtile(String title, IconData icon, VoidCallback tap) {
      return ListTile(
        leading: Icon(
          icon,
          size: 30,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: tap,
      );
    }

    return Drawer(
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking up',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            color: Colors.black,
            thickness: 2,
          ),
          Drawer_Listtile(
            'Meal',
            Icons.restaurant,
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(
            color: Colors.grey,
            thickness: 2,
          ),
          Drawer_Listtile(
            'Filters',
            Icons.settings,
            () {
              Navigator.of(context)
                  .pushReplacementNamed(FiltersScreen.routeName);
            },
          )
        ],
      ),
    );
  }
}
