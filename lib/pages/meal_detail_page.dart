import 'package:flutter/material.dart';
import '../dummy_data.dart';

Widget buildContainer(double height, Widget child) {
  return Container(
    margin: EdgeInsets.all(10),
    height: height,
    width: 300,
    padding: EdgeInsets.all(4),
    decoration: BoxDecoration(
      border: Border.all(width: 1),
      borderRadius: BorderRadius.all(Radius.circular(7)),
    ),
    child: child,
  );
}

class MealDetails extends StatelessWidget {
  static const routeName = '/meal_details';
  final Function toggleFavorite;
  final Function isFavorite;

  MealDetails(this.toggleFavorite, this.isFavorite);
  @override
  Widget build(BuildContext context) {
    final selectedMealId = ModalRoute.of(context).settings.arguments as String;
    var selectedMeal =
        DUMMY_MEALS.firstWhere((meal) => meal.id == selectedMealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
        backgroundColor: Color.fromRGBO(172, 130, 136, 1),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(238, 226, 226, 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: const Offset(
                      5.0,
                      5.0,
                    ),
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  ), //BoxShadow
                  BoxShadow(
                    color: Colors.white,
                    offset: const Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ), //BoxShadow
                ],
              ),
              padding: EdgeInsets.all(10),
              height: 270,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Ingredients',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                decoration: TextDecoration.underline,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: const Offset(
                      5.0,
                      5.0,
                    ),
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  ), //BoxShadow
                  BoxShadow(
                    color: Colors.white,
                    offset: const Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ), //BoxShadow
                ],
              ),
              height: 150,
              width: 250,
              child: ListView.builder(
                itemBuilder: (ctx, index) => Container(
                  height: 30,
                  child: Card(
                    child: Text(
                      '${index + 1}) ${selectedMeal.ingredients[index]}',
                    ),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Steps',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                decoration: TextDecoration.underline,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(3),
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Color.fromRGBO(250, 227, 208, 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: const Offset(
                      5.0,
                      5.0,
                    ),
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  ), //BoxShadow
                  BoxShadow(
                    color: Colors.white,
                    offset: const Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ), //BoxShadow
                ],
              ),
              height: 300,
              width: 300,
              child: ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Color.fromRGBO(217, 203, 192, 1),
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      title: Text('${selectedMeal.steps[index]}'),
                    ),
                    Divider(),
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorite(selectedMealId) ? Icons.star : Icons.star_border,
        ),
        onPressed: () => toggleFavorite(selectedMealId),
        backgroundColor: Colors.red[200],
      ),
    );
  }
}
