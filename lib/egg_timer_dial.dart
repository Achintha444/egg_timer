import 'package:flutter/material.dart';

import 'core/theme_data.dart';
import 'egg_timer_dial_knob.dart';
import 'tick_painter.dart';

class EggTimerDial extends StatefulWidget {
  const EggTimerDial({
    Key key,
    @required double height,
    Duration currentTime = const Duration(minutes: 0),
    Duration maxTime = const Duration(minutes: 35),
    int ticksPerSection = 5,
    @required Function onTimeSelected,
  })  : _height = height,
        _currentTime = currentTime,
        _maxTime = maxTime,
        _ticksPerSection = ticksPerSection,
        _onTimeSelected = onTimeSelected,
        super(key: key);

  final double _height;
  final Duration _currentTime;
  final Duration _maxTime;
  final int _ticksPerSection;
  final Function _onTimeSelected;

  @override
  _EggTimerDialState createState() => _EggTimerDialState();
}

class _EggTimerDialState extends State<EggTimerDial> {
  @override
  Widget build(BuildContext context) {
    // Outermost Circle
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: circleGradient,
          boxShadow: [mainShadow],
        ),
        child: Stack(
          children: <Widget>[
            // Dialer Knob
            Container(
              child: Padding(
                padding: const EdgeInsets.all(55.0),
                child: EggTimerDialKnob(
                  height: widget._height,
                  rotationPercent: this._rotationPercent(),
                ),
              ),
            ),
            //Ticks
            Container(
              height: double.infinity,
              width: double.infinity,
              padding: EdgeInsets.all(50),
              child: CustomPaint(
                painter: new TickPainter(
                  tickCount: this.widget._maxTime.inMinutes,
                  tickPerSection: this.widget._ticksPerSection,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _rotationPercent() {
    return this.widget._currentTime.inSeconds / this.widget._maxTime.inSeconds;
  }
}




