import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Container(
      height: _height,
      width: _width,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: new Center(
        child: Column(
          children: <Widget>[
            Image(
              image: AssetImage('logo.png'),
            ),
          ],
        ),
      ),
    );
  }
}
