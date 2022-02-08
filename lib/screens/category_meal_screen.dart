import 'package:flutter/material.dart';
import 'package:foodies/modules/meal.dart';
import 'package:foodies/widgets/categoryitem.dart';
import 'package:foodies/widgets/meal_item.dart';

class CategoryMeal extends StatefulWidget {
  static const routeName = 'category_meals';

  List<Meal> availableMeals;

  CategoryMeal(this.availableMeals);

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

    final meals = widget.availableMeals.where((meal) {
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
