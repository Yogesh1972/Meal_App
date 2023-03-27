import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../model/meal.dart';
import '../screen/filter.dart';
import '../screen/meal_detail.dart';
import '../screen/tabs.dart';
import '../widgets/category_item.dart';
import '../screen/category_selected_screen.dart';
import 'screen/categories_screen.dart';

void main() {
  runApp(meal_app());
}

class meal_app extends StatefulWidget {
  const meal_app({super.key});

  @override
  State<meal_app> createState() => _meal_appState();
}

class _meal_appState extends State<meal_app> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<meal> availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      filters = filterData;
      availableMeals = DUMMY_MEALS.where(
        (meals) {
          if (filters['gluten'] == true && !meals.isGlutenFree) {
            return false;
          }
          if (filters['vegan'] == true) {
            if (filters['vegan'] == true && !meals.isVegan) {
              return false;
            }
          }
          if (filters['vegetarian'] == true) {
            if (filters['vegetarian'] == true && !meals.isVegetarian) {
              return false;
            }
          }
          if (filters['lactose'] == true) {
            if (filters['lastose'] == true && !meals.isLactoseFree) {
              return false;
            }
          }
          return true;
        },
      ).toList();
    });
  }

  List<meal> favMeals = [];

  void _toggleFavorites(String Mealid) {
    final existing_Index = favMeals.indexWhere((meals) => meals.id == Mealid);

    if (existing_Index >= 0) {
      setState(() {
        favMeals.removeAt(existing_Index);
      });
    } else {
      favMeals.add(
        DUMMY_MEALS.firstWhere((meals) => meals.id == Mealid),
      );
    }
  }

  bool _isfavmeal(String mealId) {
    return favMeals.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.pink,
            titleTextStyle: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 23,
                fontWeight: FontWeight.bold)),
        primaryColor: Colors.pink,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              bodyText2: TextStyle(
                  color: Color.fromRGBO(10, 51, 51, 1),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              // titleMedium: TextStyle(
              //   fontSize: 20,
              //   fontFamily: 'RobotoCondensed',
              //   fontWeight: FontWeight.bold,
            ),
      ),
      //home: CatogeriesScreen(),

      initialRoute: '/', // default is '/'
      routes: {
        '/': (ctx) => Tabs_Screen(favMeals),
        CatogeriesScreen.routeName: (ctx) => CatogeriesScreen(),
        MealDetailScreen.routeName: (ctx) =>
            MealDetailScreen(_toggleFavorites, _isfavmeal),
        category_selected.routeName: (ctx) => category_selected(availableMeals),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_setFilters, filters),
      },

      onGenerateRoute: (settings) {
        print(settings.arguments);
        // if (settings.name == '/meal-detail') {
        //   return ...;
        // } else if (settings.name == '/something-else') {
        //   return ...;
        // }
        // return MaterialPageRoute(builder: (ctx) => CategoriesScreen(),);
      },

      // onUnknownRoute: (settings) {
      //   return MaterialPageRoute(
      //     builder: (ctx) => CatogeriesScreen(),
      //   );
      // },
    );
  }
}
