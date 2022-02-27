import 'package:flutter/material.dart';

import '../pages/category_meals_page.dart';
// Blueprint for every tile in the grid, constructor takes
// the input for title & color and fits it in the self made tile
// using container, customises it with gradient and curved borders

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;

  CategoryItem(this.id, this.title, this.color);

  //method to be used on tapping the tile, it
  //basically pushes the new screen on the stack
  //and passes the arguments provided through the route
  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMealsPage.routeName,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Text(title,
              style: TextStyle(
                fontFamily: 'RobotoCondensed',
                color: Colors.white,
                fontWeight: FontWeight.w200,
                fontSize: 20,
              )),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
