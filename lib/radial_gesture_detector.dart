import 'dart:math';

import 'package:flutter/material.dart';

import 'core/radial_gesture_detector_model.dart';
import 'egg_timer.dart';
import 'egg_timer_dial.dart';

class RadialGestureDetector extends StatefulWidget {
  RadialGestureDetector({
    Key key,
    @required double height,
    @required double width,
    @required EggTimer eggTimer,
    @required Function onTimeSelected,
    @required Function onDialStopTurning,
  })  : _height = height,
        _width = width,
        _eggTimer = eggTimer,
        _onTimeSelected = onTimeSelected,
        _onDialStopTurning = onDialStopTurning,
        super(key: key);

  double _height;
  double _width;
  EggTimer _eggTimer;
  Function _onTimeSelected;
  Function _onDialStopTurning;

  @override
  _RadialGestureDetectorState createState() => _RadialGestureDetectorState();
}

class _RadialGestureDetectorState extends State<RadialGestureDetector> {
  @override
  Widget build(BuildContext context) {
    return DialTurnGesutureDetector(
      currentTime: widget._eggTimer.getCurrentTime,
      maxTime: widget._eggTimer.getMaxTime,
      onTimeSelected: widget._onTimeSelected,
      onDialStopTurning: widget._onDialStopTurning,
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
  const DialTurnGesutureDetector({
    Key key,
    @required child,
    @required Duration currentTime,
    @required Duration maxTime,
    @required Function onTimeSelected,
    @required Function onDialStopTurning,
  })  : _child = child,
        _currentTime = currentTime,
        _maxTime = maxTime,
        _onTimeSelected = onTimeSelected,
        _onDialStopTurning = onDialStopTurning,
        super(key: key);

  final Duration _currentTime;
  final Duration _maxTime;
  final Function _onTimeSelected;
  final Function _onDialStopTurning;
  final _child;

  @override
  _DialTurnGesutureDetectorState createState() =>
      _DialTurnGesutureDetectorState();
}

class _DialTurnGesutureDetectorState extends State<DialTurnGesutureDetector> {
  PolarCoord startDragCoord;
  Duration startDragTime;
  Duration selectedTime;

  _onRadialDragStart(PolarCoord startCoord) {
    startDragCoord = startCoord;
    startDragTime = widget._currentTime;
  }

  _onRadialDragUpdate(PolarCoord updateCoord) {
    if (startDragCoord != null) {
      final angelDiff = _makeAnglePositive(updateCoord.angle - startDragCoord.angle);
      final angelPercent = angelDiff / (2 * pi);
      final timeDiffInSeconds =
          (angelPercent * widget._maxTime.inSeconds).round();
      selectedTime =
          Duration(seconds: startDragTime.inSeconds + timeDiffInSeconds);
      print('new time ${selectedTime.inMinutes}');
      widget._onTimeSelected(selectedTime);
    }
    print('$updateCoord');
  }

  double _makeAnglePositive(double angle) {
    return angle >= 0.0 ? angle : angle + (2 * pi);
  }

  _onRadialDragEnd() {
    widget._onDialStopTurning(selectedTime);
    startDragCoord = null;
    startDragTime = null;
    selectedTime = null;
  }

  @override
  Widget build(BuildContext context) {
    return RadialDragGestureDetectorModel(
      onRadialDragStart: _onRadialDragStart,
      onRadialDragUpdate: _onRadialDragUpdate,
      onRadialDragEnd: _onRadialDragEnd,
      child: widget._child,
    );
  }
}
