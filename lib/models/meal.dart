import 'package:flutter/foundation.dart';
enum Affordability { Affordable, Pricey, Luxurious }

enum Complexity { Easy, Medium, Hard }

class Meal {
  final String id;
  final List<String> categoryId;  //ids of several category in which the meal falls
  final String title;
  final Affordability affordability;
  final String imageUrl;
  final int duration;
  final List<String> ingredients;
  final Complexity complexity;
  final List<String> steps;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isLactoseFree;
  final bool isVegetarian;

  const Meal({
    @required this.id,
    @required this.categoryId,
    @required this.title,
    @required this.affordability,
    @required this.imageUrl,
    @required this.duration,
    @required this.ingredients,
    @required this.steps,
    @required this.isGlutenFree,
    @required this.isVegan,
    @required this.isLactoseFree,
    @required this.isVegetarian,
    @required this.complexity
  });
}
