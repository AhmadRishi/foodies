import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:foodies/main.dart';
import 'package:foodies/screens/tabs_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: EasySplashScreen(
          logo: Image.asset('images/1024.png'),
          logoSize: 100,
          title: const Text(
            "Foodies!",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.pink,
            ),
          ),
          backgroundColor: Colors.amberAccent,
          showLoader: true,
          loadingText: const Text("Loading..."),
          navigator: const MyApp(),
          durationInSeconds: 5,
        ),
      ),
    );
  }
}
