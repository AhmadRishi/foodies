import 'package:flutter/material.dart';
import 'package:foodies/dummy_data.dart';
import 'package:foodies/widgets/categoryitem.dart';
import 'package:foodies/widgets/meal_item.dart';

class CategoryMeal extends StatefulWidget {
  static const routeName = 'category_meals';

  @override
  _CategoryMealState createState() => _CategoryMealState();
}

class _CategoryMealState extends State<CategoryMeal> {
  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    final categoryId = routeArg['id'];
    final categoryTitle = routeArg['title'];

    final meals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(items: meals[index]);
        },
        itemCount: meals.length,
      ),
    );
  }
}
