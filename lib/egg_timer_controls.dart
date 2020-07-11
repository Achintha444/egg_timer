import 'package:egg_timer/egg_timer.dart';
import 'package:flutter/material.dart';

import 'egg_timer_button.dart';

class EggTimerControls extends StatefulWidget {
  const EggTimerControls({
    Key key,
    @required double height,
    @required double width,
    @required EggTimerState eggTimerState,
    @required Function onPaused,
    @required Function onResume,
    @required Function onRestart,
    @required Function onReset,
  })  : _height = height,
        _width = width,
        _eggTimerState = eggTimerState,
        _onPaused = onPaused,
        _onResume = onResume,
        _onRestart = onRestart,
        _onReset = onReset,
        super(key: key);

  final double _height;
  final double _width;
  final EggTimerState _eggTimerState;
  final Function _onPaused;
  final Function _onResume;
  final Function _onRestart;
  final Function _onReset;

  @override
  _EggTimerControlsState createState() => _EggTimerControlsState();
}

class _EggTimerControlsState extends State<EggTimerControls> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AnimatedOpacity(
          opacity: widget._eggTimerState == EggTimerState.paused ? 1 : 0,
          curve: Curves.decelerate,
          duration: Duration(milliseconds: 450),
          child: SizedBox(
            height: widget._height / 10,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: EggTimerButton(
                      width: widget._width,
                      height: widget._height,
                      icon: Icons.refresh,
                      text: 'Restart',
                      function: widget._onRestart,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 5, left: 5),
                  ),
                  Expanded(
                    child: EggTimerButton(
                      width: widget._width,
                      height: widget._height,
                      icon: Icons.arrow_back,
                      text: 'Reset',
                      function: widget._onReset,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        AnimatedOpacity(
          opacity: widget._eggTimerState == EggTimerState.ready ? 0 : 1,
          duration: Duration(milliseconds: 550),
          child: SizedBox(
            height: widget._height / 10,
            //child: Padding(
            //padding: const EdgeInsets.all(8.0),
            child: EggTimerButton(
              width: widget._width,
              height: widget._height,
              icon: widget._eggTimerState == EggTimerState.running
                  ? Icons.pause
                  : Icons.play_arrow,
              text: widget._eggTimerState == EggTimerState.running
                  ? 'Pause'
                  : 'Resume',
              color: Theme.of(context).primaryColor,
              function: widget._eggTimerState == EggTimerState.running
                  ? widget._onPaused
                  : widget._onResume,
            ),
            //),
          ),
        ),
      ],
    );
  }
}
