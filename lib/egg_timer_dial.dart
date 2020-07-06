import 'package:egg_timer/core/colours.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'core/theme_data.dart';
import 'egg_timer_dial_knob.dart';

class EggTimerDial extends StatelessWidget {
  const EggTimerDial({
    Key key,
    @required double height,
  })  : _height = height,
        super(key: key);

  final double _height;

  @override
  Widget build(BuildContext context) {
    // Outermost Circle
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: circleGradient,
        boxShadow: [mainShadow],
      ),
      child: Stack(
        children: <Widget>[
          // Dialer Knob
          Container(
            child: Padding(
              padding: const EdgeInsets.all(55.0),
              child: EggTimerDialKnob(height: _height),
            ),
          ),
          //Ticks
          Container(
            height: double.infinity,
            width: double.infinity,
            padding: EdgeInsets.all(50),
            child: CustomPaint(
              painter: new TickPainter(),
            ),
          ),
        ],
      ),
    );
  }
}

class TickPainter extends CustomPainter {
  static const double LONG_TICK = 14.0;
  static const double SHORT_TICK = 4.0;

  final tickCount;
  final tickPerSection;
  final ticksInset;
  final tickPaint;
  final textPainter;
  final textStyle;

  TickPainter({
    this.tickCount = 35,
    this.tickPerSection = 5,
    this.ticksInset = 0.0,
  })  : tickPaint = new Paint(),
        textPainter = new TextPainter(
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
        ),
        textStyle = TextStyle(
            color: THIRD_COLOUR,
            fontSize: 20,
            fontFamily: 'FjallaOne',
            fontWeight: FontWeight.bold,
            letterSpacing: -1.2) {
    tickPaint.color = THIRD_COLOUR;
    tickPaint.strokeWidth = 1.0;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);

    canvas.save();

    final radius = size.width / 2;

    for (int i = 0; i < tickCount; i++) {
      final tickeLength = i % tickPerSection == 0 ? LONG_TICK : SHORT_TICK;

      canvas.drawLine(
        new Offset(0.0, -radius),
        new Offset(0.0, -radius - tickeLength),
        tickPaint,
      );

      if (i % tickPerSection == 0) {
        // paint the text
        canvas.save();
        canvas.translate(0.0, -(size.width / 2) - 30.0);

        textPainter.text = new TextSpan(
          text: '$i',
          style: textStyle,
        );

        // layout the text
        textPainter.layout();

        textPainter.paint(
          canvas,
          new Offset(
            -textPainter.width / 2,
            -textPainter.height / 2,
          ),
        );

        canvas.restore();
      }

      canvas.rotate(2 * math.pi / 35);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
