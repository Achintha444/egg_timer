import 'package:egg_timer/egg_timer.dart';
import 'package:flutter/material.dart';

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
  
  //final DateFormat
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            widget._eggTimerState == EggTimerState.ready ? 0.0 : -200.0,
            0.0,
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: widget._height / 35,
              ),
              child: new Text(
                '${widget._selectionTime.inMinutes}',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: widget._height / 6,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 10),
              ),
            ),
          ),
        ),
        Opacity(
          opacity: widget._eggTimerState != EggTimerState.ready ? 1.0 : 0.0,
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: widget._height / 35,
              ),
              child: new Text(
                '${widget._countDownTime.inMinutes}:${widget._countDownTime.inSeconds-widget._countDownTime.inMinutes*60}',
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
