import 'package:egg_timer/core/colours.dart';
import 'package:flutter/material.dart';

class EggTimerButton extends StatelessWidget {
  const EggTimerButton(
      {Key key,
      @required double width,
      @required double height,
      @required IconData icon,
      @required String text,
      @required Function function,
      Color color = ACCENT_COLOUR,})
      : _width = width,
        _height = height,
        _icon = icon,
        _text = text,
        _function = function,
        _color = color,
        super(key: key);

  final double _width;
  final double _height;
  final IconData _icon;
  final String _text;
  final Function _function;
  final Color _color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: FlatButton(
        //elevation: 0,
        color: _color,
        onPressed: _function,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              _icon,
            ),
            Padding(
              padding: EdgeInsets.only(
                right: _width / 85,
                left: _width / 85,
              ),
            ),
            Text(
              _text,
              textAlign: TextAlign.center,
              style: TextStyle(
                letterSpacing: 2,
                fontSize: _height / 45,
                fontWeight: FontWeight.w300,
              ),
            )
          ],
        ),
      ),
    );
  }
}
