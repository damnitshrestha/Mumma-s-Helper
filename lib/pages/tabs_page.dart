import 'package:flutter/material.dart';

import './categories_page.dart';
import './favourites_page.dart';
import '../widgets/navigation_menu.dart';
import '../models/meal.dart';

class TabsPage extends StatefulWidget {
  @override
  _TabsPageState createState() => _TabsPageState();

  List<Meal> favouriteMeals;
  TabsPage(this.favouriteMeals);
}

class _TabsPageState extends State<TabsPage> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {'page': CategoriesPage(), 'title': 'Categories'},
      {
        'page': FavouritesPage(widget.favouriteMeals),
        'title': 'Your Favorites'
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(118, 71, 91, 1),
        title: Text(
          'Mumma\'s Helper',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w200),
        ),
      ),
      drawer: NavigationMenu(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        unselectedItemColor: Colors.grey[200],
        selectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(125, 80, 92, 0.8),
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(125, 80, 92, 0.8),
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
