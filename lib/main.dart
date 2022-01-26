import 'package:flutter/material.dart';
import 'package:foodies/screens/Categories.dart';
import 'package:foodies/screens/category_meal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foodies',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        //brightness: Brightness.dark,
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(
              color: Color.fromRGBO(20, 50, 50, 1),
            ),
            bodyText2: TextStyle(
              color: Color.fromRGBO(20, 50, 50, 1),
            ),
            headline2: TextStyle(
              fontSize: 22,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),
      routes: {
        '/': (context) => Categories(),
        CategoryMeal.routeName: (context) => CategoryMeal(),
      },
      //home: const MyHomePage(title: 'Foodies'),
      //home: Categories(),
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
