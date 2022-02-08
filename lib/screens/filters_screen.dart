import 'package:flutter/material.dart';
import 'package:foodies/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = 'filters';

  var filterFood; // function
  Map<String, bool> currentFilter;
  FiltersScreen(this.currentFilter, this.filterFood);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilter['gluten']!;
    _lactoseFree = widget.currentFilter['lactose']!;
    _vegan = widget.currentFilter['vegan']!;
    _vegetarian = widget.currentFilter['vegetarian']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        actions: [
          IconButton(
              onPressed: () {
                Map<String, bool> selectedFilter = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.filterFood(selectedFilter);
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchItem(
                title: 'Gluten-Free',
                description: 'Only include Gluten-Free Meals',
                value: _glutenFree,
                onChange: (newValue) => setState(() {
                  _glutenFree = newValue;
                }),
              ),
              buildSwitchItem(
                  title: 'Lactose-Free',
                  description: 'Only include Lactose-Free Meals',
                  value: _lactoseFree,
                  onChange: (newValue) => setState(() {
                        _lactoseFree = newValue;
                      })),
              buildSwitchItem(
                  title: 'Vegetarian',
                  description: 'Only include Vegetarian Meals',
                  value: _vegetarian,
                  onChange: (newValue) => setState(() {
                        _vegetarian = newValue;
                      })),
              buildSwitchItem(
                  title: 'Vegan',
                  description: 'Only include Vegan Meals',
                  value: _vegan,
                  onChange: (newValue) => setState(() {
                        _vegan = newValue;
                      })),
            ],
          ))
        ],
      ),
      drawer: MainDrawer(),
    );
  }

  SwitchListTile buildSwitchItem(
      {required String title,
      required String description,
      required bool value,
      required dynamic onChange}) {
    return SwitchListTile(
      value: value,
      onChanged: onChange,
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(description),
    );
  }
}
