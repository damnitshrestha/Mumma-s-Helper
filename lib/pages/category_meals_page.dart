import 'package:flutter/material.dart';

import '../widgets/meal_tile.dart';
import '../models/meal.dart';

class CategoryMealsPage extends StatefulWidget {
  //creating the route name in the widget file itself
  //so that accessing gets less confusing from home page
  static const routeName = '/category_meals';

  final List<Meal> availableMeals;

  CategoryMealsPage(this.availableMeals);

  @override
  State<CategoryMealsPage> createState() => _CategoryMealsPageState();
}

class _CategoryMealsPageState extends State<CategoryMealsPage> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadedInitData = false;

  @override
  void initState() {
    // ...
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;

      categoryTitle = routeArgs['title'];
      final selectedId = routeArgs['id'];
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categoryId.contains(selectedId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    //accepts the argument provided in the route and stores the
    // variables through map
    var routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final title = routeArgs['title'];
    final chosenId = routeArgs['id'];
    //this checks whether there is any same ID in
    //DUMMY_MEALS as the chosenID, if yes then it adds
    //in the list mealsInTheCategory
    final mealsInTheCategory = widget.availableMeals.where((meal) {
      return meal.categoryId.contains(chosenId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Color.fromRGBO(207, 156, 157, 1),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealTile(
            affordability: mealsInTheCategory[index].affordability,
            complexity: mealsInTheCategory[index].complexity,
            duration: mealsInTheCategory[index].duration,
            id: mealsInTheCategory[index].id,
            imageUrl: mealsInTheCategory[index].imageUrl,
            title: mealsInTheCategory[index].title,
          );
        },
        itemCount: mealsInTheCategory.length,
      ),
    );
  }
}
