import 'package:flutter/material.dart';

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
              width: _width,
              height: _height / 4,
              child: Container(
                color: Colors.red,
              ),
            ),

            // Clock
            SizedBox(
              child: Container(
                color: Colors.blueAccent,
                child: Padding(
                  padding: EdgeInsets.all(30.0),
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
            SizedBox(
              height: _height / 12,
              child: Container(
                color: Colors.green,
              ),
            ),
            SizedBox(
              height: _height / 12,
              child: Container(
                color: Colors.greenAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
