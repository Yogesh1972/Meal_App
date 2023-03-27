import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/widgets/meal_item.dart';
import '../widgets/category_item.dart';
import '../dummy_data.dart';
import '../model/meal.dart';

class category_selected extends StatefulWidget {
  static const routeName = '/catogary_selected';

  final List<meal> availableMeals;

  category_selected(this.availableMeals);

  @override
  State<category_selected> createState() => _category_selectedState();
}

class _category_selectedState extends State<category_selected> {
  // final String catoid;
  String? catotitle;
  List<meal>? displayedMeals;
  var _loadedInitData = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      // TODO: implement didChangeDependencies
      final routeAgrs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      final catoid = routeAgrs['id'];
      catotitle = routeAgrs['title']!;
      displayedMeals = widget.availableMeals.where((meals) {
        return meals.Catogary.contains(catoid);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeItem(String meaId) {
    setState(
      () {
        displayedMeals!.removeWhere(
          (meal) => meal.id == meaId,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(catotitle!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return meal_item(
            id: displayedMeals![index].id,
            Title: displayedMeals![index].Name,
            ImageUrl: displayedMeals![index].ImageUrl,
            affordability: displayedMeals![index].affordability,
            complexity: displayedMeals![index].complexity,
            duration: displayedMeals![index].duration,
          );
        },
        itemCount: displayedMeals!.length,
      ),
    );
  }
}
