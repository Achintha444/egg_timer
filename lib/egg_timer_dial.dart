import 'package:flutter/material.dart';

import 'core/colours.dart';
import 'core/theme_data.dart';

class EggTimerDial extends StatelessWidget {
  const EggTimerDial({
    Key key,
    @required double height,
  }) : _height = height, super(key: key);

  final double _height;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: circleGradient,
        boxShadow: [mainShadow],
      ),
      child: Padding(
        padding: const EdgeInsets.all(55.0),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: circleGradient,
            boxShadow: [mainShadow],
            border: Border.all(
                color: MAIN_COLOUR.withOpacity(0.5),
                width: 10.0),
          ),
          child: Center(
            child: Image(
              image: AssetImage('assets/circle.png'),
              height: _height / 7,
            ),
          ),
        ),
      ),
    );
  }
}