import 'package:egg_timer/core/theme_data.dart';
import 'package:egg_timer/splash_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Egg Timer',
      theme: theme_data,
      home: SplashScreen(),
    );
  }
}