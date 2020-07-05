import 'package:flutter/material.dart';

import 'egg_timer_button.dart';
import 'egg_timer_display.dart';

class ClcokMainInterface extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            // Timer
            SizedBox(
              height: _height / 3.5,
              child: EggTimerDisplay(height: _height),
            ),
            // Clock
            SizedBox(
              child: Container(
                color: Colors.blueAccent,
                child: Padding(
                  padding: EdgeInsets.only(
                    right: _width / 15.0,
                    left: _width / 15.0,
                  ),
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: Container(
                      color: Colors.amber,
                    ),
                  ),
                ),
              ),
            ),

            // Expanded Block
            Expanded(child: Container()),

            // 2 Rows of Controlers
            EggTimerControls(height: _height, width: _width),
          ],
        ),
      ),
    );
  }
}


