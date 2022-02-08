import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodies/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Theme.of(context).accentColor,
            height: 150,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            child: Text(
              ' Foodies!',
              style: TextStyle(
                fontSize: 40,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          buildDrawerItem(Icons.restaurant, 'Meals', () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildDrawerItem(Icons.settings, 'Filters', () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          })
        ],
      ),
    );
  }

  ListTile buildDrawerItem(IconData icon, String title, tapHandle) {
    return ListTile(
      onTap: tapHandle,
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
