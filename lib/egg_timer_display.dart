import 'package:flutter/material.dart';

class EggTimerDisplay extends StatefulWidget {
  const EggTimerDisplay({
    Key key,
    @required double height,
  })  : _height = height,
        super(key: key);

  final double _height;

  @override
  _EggTimerDisplayState createState() => _EggTimerDisplayState();
}

class _EggTimerDisplayState extends State<EggTimerDisplay> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(
          top: widget._height / 35,
        ),
        child: new Text(
          '13:45',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: widget._height / 6,
            fontWeight: FontWeight.w600,
            letterSpacing: 10
          ),
        ),
      ),
    );
  }
}
