import 'package:flutter/material.dart';

import 'core/theme_data.dart';
import 'egg_timer_dial_knob.dart';

class EggTimerDial extends StatelessWidget {
  const EggTimerDial({
    Key key,
    @required double height,
  })  : _height = height,
        super(key: key);

  final double _height;

  @override
  Widget build(BuildContext context) {
    // Outermost Circle
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: circleGradient,
        boxShadow: [mainShadow],
      ),
      child: Padding(
        padding: const EdgeInsets.all(55.0),
        child: EggTimerDialKnob(height: _height),
      ),
    );
  }
}




