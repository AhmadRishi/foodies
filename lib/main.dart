import 'package:flutter/material.dart';
import 'package:foodies/dummy_data.dart';
import 'package:foodies/modules/meal.dart';
import 'package:foodies/screens/Categories_screen.dart';
import 'package:foodies/screens/category_meal_screen.dart';
import 'package:foodies/screens/details.dart';
import 'package:foodies/screens/filters_screen.dart';
import 'package:foodies/screens/tabs_screen.dart';
import 'package:foodies/splashscreen.dart';

void main() {
  runApp(SplashScreen());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> meals = DUMMY_MEALS;

  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      meals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenFree) return false;
        if (_filters['lactose']! && !meal.isLactoseFree) return false;
        if (_filters['vegan']! && !meal.isVegan) return false;
        if (_filters['vegetarian']! && !meal.isVegetarian) return false;
        return true;
      }).toList();
    });
  }

  List<Meal> _favoriteMeals = [];

  void _toggleFavorite(String mealId) {
    final favIndex = _favoriteMeals.indexWhere((meal) => meal.id == mealId);

    if (favIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(favIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(meals.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isFavorite(String mealId) {
    return _favoriteMeals.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foodies',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amberAccent,
        //brightness: Brightness.dark,
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: const TextStyle(
              color: Color.fromRGBO(20, 50, 50, 1),
            ),
            bodyText2: const TextStyle(
              color: Color.fromRGBO(20, 50, 50, 1),
            ),
            headline2: const TextStyle(
              fontSize: 22,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),
      routes: {
        '/': (context) => TabsScreen(_favoriteMeals),
        CategoryMeal.routeName: (context) => CategoryMeal(meals),
        MealDetalis.routeName: (context) => MealDetalis(_toggleFavorite, _isFavorite),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(_filters, _setFilters),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Categories(),
    );
  }
}
