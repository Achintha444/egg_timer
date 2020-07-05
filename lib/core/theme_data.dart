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
    buttonColor: MAIN_COLOUR,
    splashColor: ACCENT_COLOUR,
  ),
);
