import 'package:flutter/material.dart';

import 'core/colours.dart';
import 'core/theme_data.dart';

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
      child: Padding(
        padding: const EdgeInsets.all(55.0),
        child: Stack(
          children: <Widget>[
            // Two inner most circle
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: circleGradient,
                boxShadow: [mainShadow],
                border: Border.all(
                  color: MAIN_COLOUR.withOpacity(0.5),
                  width: 10.0,
                ),
              ),
              child: Center(
                child: Image(
                  image: AssetImage('assets/circle.png'),
                  height: _height / 7,
                ),
              ),
            ),

            //Arrow Painter
            Container(
              width: double.infinity,
              height: double.infinity,
              child: CustomPaint(
                painter: new ArrowPainter(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
