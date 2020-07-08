import 'dart:math';

import 'package:flutter/material.dart';

import 'core/colours.dart';

class ArrowPainter extends CustomPainter {
  final Paint dialArrowPaint;
  final double rotationPercent;

  ArrowPainter({@required this.rotationPercent}) : dialArrowPaint = new Paint() {
    dialArrowPaint.color = THIRD_COLOUR;
    dialArrowPaint.style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.height/2;
    canvas.translate(radius,radius);
    canvas.rotate(2*pi*rotationPercent);
    //canvas.restore();
    Path path = new Path();
    path.moveTo(0.0, -radius-12.0);
    path.lineTo(9, -radius+0.4);
    path.lineTo(-9, -radius+0.4);
    path.close();

    canvas.drawPath(path, dialArrowPaint);

    canvas.drawShadow(path, Colors.black, 3, false);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
