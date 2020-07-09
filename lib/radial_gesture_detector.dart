import 'package:flutter/material.dart';

import 'core/radial_gesture_detector_model.dart';
import 'egg_timer.dart';
import 'egg_timer_dial.dart';

class RadialGestureDetector extends StatefulWidget {
  RadialGestureDetector(
      {Key key,
      @required double height,
      @required double width,
      @required EggTimer eggTimer,
      @required Function onTimeSelected})
      : _height = height,
        _width = width,
        _eggTimer = eggTimer,
        _onTimeSelected = onTimeSelected,
        super(key: key);

  double _height;
  double _width;
  EggTimer _eggTimer;
  Function _onTimeSelected;

  @override
  _RadialGestureDetectorState createState() => _RadialGestureDetectorState();
}

class _RadialGestureDetectorState extends State<RadialGestureDetector> {
  @override
  Widget build(BuildContext context) {
    return DialTurnGesutureDetector(
      child: SizedBox(
        height: widget._height / 2.2,
        child: Container(
          child: Padding(
            padding: EdgeInsets.only(
              right: widget._width / 15.0,
              left: widget._width / 15.0,
            ),
            child: AspectRatio(
              aspectRatio: 1.0,
              child: EggTimerDial(
                height: widget._height,
                maxTime: widget._eggTimer.getMaxTime,
                currentTime: widget._eggTimer.getCurrentTime,
                onTimeSelected: widget._onTimeSelected,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DialTurnGesutureDetector extends StatefulWidget {
  final child;

  const DialTurnGesutureDetector({Key key, @required this.child})
      : super(key: key);

  @override
  _DialTurnGesutureDetectorState createState() =>
      _DialTurnGesutureDetectorState();
}

class _DialTurnGesutureDetectorState extends State<DialTurnGesutureDetector> {
  _onRadialDragStart(PolarCoord startCoord) {}

  _onRadialDragUpdate(PolarCoord updateCoord) {
    print ('$updateCoord');
  }

  _onRadialDragEnd() {}

  @override
  Widget build(BuildContext context) {
    return RadialDragGestureDetectorModel(
      onRadialDragStart: _onRadialDragStart,
      onRadialDragUpdate: _onRadialDragUpdate,
      onRadialDragEnd: _onRadialDragEnd,
      child: widget.child,
    );
  }
}
