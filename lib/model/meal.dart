import 'package:flutter/foundation.dart';

enum Complexity { Simple, Challenging, Hard }

enum Affordability { Affordable, Pricey, Luxurious }

class meal {
  final String id;
  final List<String> Catogary;
  final String Name;
  final String ImageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const meal(
      {required this.id,
      required this.Catogary,
      required this.ImageUrl,
      required this.Name,
      required this.ingredients,
      required this.complexity,
      required this.duration,
      required this.steps,
      required this.affordability,
      required this.isGlutenFree,
      required this.isLactoseFree,
      required this.isVegan,
      required this.isVegetarian});
}
