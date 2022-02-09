import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:foodies/modules/meal.dart';
import 'package:foodies/widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  List<Meal> favoriteMeals = [];

  FavoriteScreen(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return const Center(
        child: Text('You have no favorties yet - try adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(items: favoriteMeals[index]);
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
