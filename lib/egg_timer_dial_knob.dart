import 'package:flutter/material.dart';

import 'arrow_painter.dart';
import 'core/colours.dart';
import 'core/theme_data.dart';

class EggTimerDialKnob extends StatefulWidget {
  const EggTimerDialKnob({
    Key key,
    @required double height,
  }) : _height = height, super(key: key);

  final double _height;

  @override
  _EggTimerDialKnobState createState() => _EggTimerDialKnobState();
}

class _EggTimerDialKnobState extends State<EggTimerDialKnob> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Two inner most circle
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: circleGradient,
            boxShadow: [mainShadow],
            border: Border.all(
              color: MAIN_COLOUR.withOpacity(0.5),
              width: 10.0,
            ),
          ),
          child: Center(
            child: Image(
              image: AssetImage('assets/circle.png'),
              height: widget._height / 7,
            ),
          ),
        ),

        //Arrow Painter
        Container(
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: new ArrowPainter(),
          ),
        ),
      ],
    );
  }
}