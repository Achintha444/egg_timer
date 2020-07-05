import 'package:flutter/material.dart';

class EggTimerButton extends StatelessWidget {
  const EggTimerButton({
    Key key,
    @required double width,
    @required double height,
    @required IconData icon,
    @required String text,
    @required Function function,
  }) : _width = width, _height = height, _icon=icon, _text=text, _function = function, super(key: key);

  final double _width;
  final double _height;
  final IconData _icon;
  final String _text;
  final Function _function;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: RaisedButton(
        elevation: 0,
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
                  right: _width / 85, left: _width / 85),
            ),
            Text(
              _text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  letterSpacing: 2,
                  fontSize: _height / 45,
                  fontWeight: FontWeight.w300),
            )
          ],
        ),
      ),
    );
  }
}