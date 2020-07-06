import 'package:flutter/material.dart';

import 'core/colours.dart';

class ArrowPainter extends CustomPainter {
  final Paint dialArrowPaint;

  ArrowPainter() : dialArrowPaint = new Paint() {
    dialArrowPaint.color = THIRD_COLOUR;
    dialArrowPaint.style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();

    canvas.translate(size.width / 2, 0.0);

    Path path = new Path();
    path.moveTo(3.0, -12.0);
    path.lineTo(13, 0.4);
    path.lineTo(-5, 0.4);
    path.close();

    canvas.drawPath(path, dialArrowPaint);

    canvas.drawShadow(path, Colors.black, 3, false);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}