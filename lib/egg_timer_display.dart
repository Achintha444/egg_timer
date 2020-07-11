import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

import 'egg_timer.dart';

class EggTimerDisplay extends StatefulWidget {
  const EggTimerDisplay({
    Key key,
    @required double height,
    @required EggTimerState eggTimerState,
    @required Duration selectionTime,
    @required Duration countDownTime,
  })  : _height = height,
        _eggTimerState = eggTimerState,
        _selectionTime = selectionTime,
        _countDownTime = countDownTime,
        super(key: key);

  final double _height;
  final EggTimerState _eggTimerState;
  final Duration _selectionTime;
  final Duration _countDownTime;

  @override
  _EggTimerDisplayState createState() => _EggTimerDisplayState();
}

class _EggTimerDisplayState extends State<EggTimerDisplay> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedOpacity(
          opacity: widget._eggTimerState == EggTimerState.ready ? 1.0 : 0.0,
          duration: Duration(milliseconds: 450),
          curve: Curves.decelerate,
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: widget._height / 35,
              ),
              child: new Text(
                formatDate(
                    DateTime(
                        2020, 01, 01, 01, 00, widget._selectionTime.inSeconds),
                    [nn]),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: widget._height / 6,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 10),
              ),
            ),
          ),
        ),
        AnimatedOpacity(
          opacity: widget._eggTimerState != EggTimerState.ready ? 1.0 : 0.0,
          duration: Duration(milliseconds: 550),
          curve: Curves.decelerate,
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: widget._height / 35,
              ),
              child: new Text(
                formatDate(
                    DateTime(
                        2020, 1, 1, 1, 00, widget._countDownTime.inSeconds),
                    [nn, ':', ss]),
                // '${widget._countDownTime.inMinutes}:${widget._countDownTime.inSeconds-widget._countDownTime.inMinutes*60}',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: widget._height / 6,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
