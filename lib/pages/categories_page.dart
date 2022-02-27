import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/category_tile.dart';

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.all(15),
        //creates an iterable list and passes all the dummy values provided
        //to display on the page
        children: DUMMY_CATEGORIES
            .map((dummyItem) =>
                CategoryItem(dummyItem.id, dummyItem.title, dummyItem.color))
            .toList(),
        //customisation for grid
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 3 / 2,
          maxCrossAxisExtent: 200,
        ),
      ),
    );
  }
}
