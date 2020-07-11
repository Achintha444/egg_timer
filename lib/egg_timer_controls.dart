import 'package:egg_timer/egg_timer.dart';
import 'package:flutter/material.dart';

import 'egg_timer_button.dart';

class EggTimerControls extends StatefulWidget {
  const EggTimerControls({
    Key key,
    @required double height,
    @required double width,
    @required EggTimerState eggTimerState,
  })  : _height = height,
        _width = width,
        _eggTimerState = eggTimerState,
        super(key: key);

  final double _height;
  final double _width;
  final EggTimerState _eggTimerState;

  @override
  _EggTimerControlsState createState() => _EggTimerControlsState();
}

class _EggTimerControlsState extends State<EggTimerControls> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AnimatedOpacity(
          opacity: 1,
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
                      function: () {},
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
                      function: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        AnimatedOpacity(
          opacity: 1,
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
                  ?'Pause':
                  'Resume',
              color: Theme.of(context).primaryColor,
              function: () {},
            ),
            //),
          ),
        ),
      ],
    );
  }
}
