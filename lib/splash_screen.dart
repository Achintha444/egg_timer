import 'dart:async';

import 'package:egg_timer/clock_main_interface.dart';
import 'package:flutter/material.dart';

import 'core/colours.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = new Duration(seconds: 3);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => ClcokMainInterface()));
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Container(
      height: _height,
      width: _width,
      color: THIRD_COLOUR,
      child: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage('assets/logo.png'),
              height: _height / 3.7,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: _height / 15),
            ),
            Text(
              'EGG TIMER'.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                decoration: TextDecoration.none,
                letterSpacing: 5,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: _height / 22),
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
