import 'package:flutter/material.dart';

import 'core/theme_data.dart';
import 'egg_timer.dart';
import 'egg_timer_controls.dart';
import 'egg_timer_display.dart';
import 'radial_gesture_detector.dart';

class ClcokMainInterface extends StatefulWidget {
  @override
  _ClcokMainInterfaceState createState() => _ClcokMainInterfaceState();
}

class _ClcokMainInterfaceState extends State<ClcokMainInterface> {
  EggTimer _eggTimer;
  _ClcokMainInterfaceState() {
    _eggTimer = new EggTimer(
      maxTime: Duration(minutes: 35),
      onTimeUpdated: this._onTimerUpdated,
    );
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: mainGradient),
        height: _height,
        width: _width,
        child: Center(
          child: Column(
            children: <Widget>[
              // Timer
              SizedBox(
                height: _height / 3.5,
                child: EggTimerDisplay(
                  height: _height,
                  eggTimerState: _eggTimer.getState,
                  countDownTime: _eggTimer.getCurrentTime,
                  selectionTime: _eggTimer.getLastStartTime,
                ),
              ),

              // Clock
              RadialGestureDetector(
                height: _height,
                width: _width,
                eggTimer: _eggTimer,
                onTimeSelected: this._onTimeSelected,
                onDialStopTurning: this._onStopTurning,
              ),

              // Expanded Block
              Expanded(child: Container()),

              // 2 Rows of Controlers
              EggTimerControls(
                height: _height,
                width: _width,
                eggTimerState: _eggTimer.getState,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTimeSelected(Duration newTime) {
    setState(() {
      _eggTimer.setCurrentTime = newTime;
    });
  }

  void _onStopTurning(Duration newTime) {
    setState(() {
      _eggTimer.setCurrentTime = newTime;
      _eggTimer.resume();
    });
  }

  void _onTimerUpdated() {
    setState(() {});
  }
}
