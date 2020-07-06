import 'package:egg_timer/core/colours.dart';
import 'package:flutter/material.dart';

var themeData = ThemeData(
  primaryColor: MAIN_COLOUR,
  accentColor: ACCENT_COLOUR,
  errorColor: Color(0xffde483e),
  cursorColor: Color(0xff737373),
  scaffoldBackgroundColor: ACCENT_COLOUR.withOpacity(0.999),
  fontFamily: 'FjallaOne',
  buttonTheme: ButtonThemeData(
    buttonColor: ACCENT_COLOUR,
    splashColor: MAIN_COLOUR.withOpacity(0.6),
  ),
);

var mainGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [MAIN_COLOUR, ACCENT_COLOUR],
);

var circleGradient = RadialGradient(
  center: Alignment.center, // near the top right
  radius: 0.5,
  colors: [
    MAIN_COLOUR,
    ACCENT_COLOUR,
  ],
);

var mainShadow = BoxShadow(
  color: THIRD_COLOUR.withOpacity(0.5),
  blurRadius: 2,
  spreadRadius: 2,
  offset: Offset(0, 1),
);

var subShadow = BoxShadow(
  color: THIRD_COLOUR.withOpacity(0.5),
  blurRadius: 2,
  spreadRadius: 1,
  offset: Offset(0, 1),
);