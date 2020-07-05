import 'package:flutter/material.dart';

class EggTimerControls extends StatelessWidget {
  const EggTimerControls({
    Key key,
    @required double height,
    @required double width,
  }) : _height = height, _width = width, super(key: key);

  final double _height;
  final double _width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: _height / 10,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: EggTimerButton(
                    width: _width,
                    height: _height,
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
                    width: _width,
                    height: _height,
                    icon: Icons.arrow_back,
                    text: 'Reset',
                    function: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: _height / 10,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: EggTimerButton(
              width: _width,
              height: _height,
              icon: Icons.pause,
              text: 'Pause',
              function: () {},
            ),
          ),
        ),
      ],
    );
  }
}