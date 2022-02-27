import 'package:flutter/material.dart';
import '../pages/filters_page.dart';

Widget buildListTile(String text, IconData icon, Function tapHandler) {
  return ListTile(
    leading: Icon(icon),
    title: Text(
      text,
      style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18,
          fontFamily: 'RobotoCondensed'),
    ),
    onTap: tapHandler,
  );
}

class NavigationMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromRGBO(244, 231, 226, 1),
      child: Column(
        children: <Widget>[
          Container(
            color: Color.fromRGBO(147, 167, 163, 1),
            child: Center(
              child: Text(
                'Mumma\'s Helper',
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w200,
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: 'RobotoCondensed'),
              ),
            ),
            height: 100,
            width: double.infinity,
          ),
          buildListTile(
            'Meals',
            Icons.restaurant_menu,
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          buildListTile(
            'Filters',
            Icons.settings,
            () {
              Navigator.of(context)
                  .pushReplacementNamed(FiltersScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
