import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/navigation_menu.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters_screen';
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _lactoseFree = false;
  var _glutenFree = false;
  var _isVegan = false;
  var _isVegetarian = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _isVegan = widget.currentFilters['vegan'];
    _isVegetarian = widget.currentFilters['vegetarian'];
    _lactoseFree = widget.currentFilters['lactose'];
    super.initState();
  }

  Widget _buildSwitch(String title, String description, bool currentValue,
      Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[700],
        title: Text('Filters'),
      ),
      drawer: NavigationMenu(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                'Add Filter(s) to your meals',
                style: TextStyle(
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitch(
                  'Gluten-Free',
                  'Includes meals which are free of gluten',
                  _glutenFree,
                  (updatedValue) {
                    setState(() {
                      _glutenFree = updatedValue;
                    });
                  },
                ),
                _buildSwitch(
                  'Only Vegan',
                  'Includes meals which are free of gluten',
                  _isVegan,
                  (updatedValue) {
                    setState(() {
                      _isVegan = updatedValue;
                    });
                  },
                ),
                _buildSwitch(
                    'Only Vegeterian',
                    'Includes meals which are free of gluten',
                    _isVegetarian, (updatedValue) {
                  setState(() {
                    _isVegetarian = updatedValue;
                  });
                }),
                _buildSwitch(
                    'Lactose-Free',
                    'Includes meals which are free of gluten',
                    _lactoseFree, (updatedValue) {
                  setState(() {
                    _lactoseFree = updatedValue;
                  });
                }),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            width: double.infinity,
            height: 60.0,
            child: RaisedButton(
              padding: EdgeInsets.all(16),
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'vegan': _isVegan,
                  'lactose': _lactoseFree,
                  'vegetarian': _isVegetarian,
                };
                widget.saveFilters(selectedFilters);

                Navigator.of(context).pushReplacementNamed('/');
              },
              child: Text('Save Filters',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w600)),
              color: Colors.teal[400],
            ),
          ),
        ],
      ),
    );
  }
}
