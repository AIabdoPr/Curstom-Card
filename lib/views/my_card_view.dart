import 'dart:math';

import 'package:flutter/material.dart';

class MyCardView extends StatefulWidget {
  final double width, height;
  MyCardView({required this.width, required this.height});

  @override
  _MyCardViewState createState() => _MyCardViewState();
}

class _MyCardViewState extends State<MyCardView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: CustomPaint(
        painter: CardPainter(),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              child: Text(
                "200 EG",
                style: TextStyle(color: Colors.red[900], fontSize: 26),
              ),
              top: widget.height * 0.08,
            ),
            Positioned(
              child: Text(
                "3",
                style: TextStyle(
                    color: Colors.red[900],
                    fontSize: 140,
                    fontWeight: FontWeight.bold),
              ),
              top: widget.height * 0.26,
            ),
            Positioned(
              child: Text(
                "Ticket",
                style: TextStyle(color: Colors.red[900], fontSize: 25),
              ),
              top: widget.height * 0.58,
            ),
            Positioned(
              child: RaisedButton(
                  padding: EdgeInsets.symmetric(vertical: 13),
                  onPressed: () {},
                  color: Colors.greenAccent[400],
                  shape: StadiumBorder(),
                  child: Text("Buy",
                      style: TextStyle(color: Colors.white, fontSize: 23))),
              top: widget.height * 0.88,
              width: widget.width * 0.9,
            ),
          ],
        ),
      ),
    );
  }
}

class CardPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double circleRadius = size.height * 0.05;
    Rect shapeBounds = Rect.fromLTWH(0, 0, size.width, size.height);

    Rect circleTL = Rect.fromCircle(
        center: Offset(0, shapeBounds.height * 0.25), radius: circleRadius);
    Rect circleBL = Rect.fromCircle(
        center: Offset(0, shapeBounds.height * 0.75), radius: circleRadius);
    Rect circleTR = Rect.fromCircle(
        center: Offset(shapeBounds.width, shapeBounds.height * 0.25),
        radius: circleRadius);
    Rect circleBR = Rect.fromCircle(
        center: Offset(shapeBounds.width, shapeBounds.height * 0.75),
        radius: circleRadius);

    Paint paint = Paint()..color = Colors.white;

    Path backgroundPath = Path()
      ..moveTo(shapeBounds.left, shapeBounds.top)
      ..arcTo(circleTL, -pi / 2, pi, false)
      ..arcTo(circleBL, -pi / 2, pi, false)
      ..lineTo(shapeBounds.bottomLeft.dx, shapeBounds.bottomLeft.dy)
      ..lineTo(shapeBounds.bottomRight.dx, shapeBounds.bottomRight.dy)
      ..arcTo(circleTR, pi / 2, pi, false)
      ..arcTo(circleBR, pi / 2, pi, false)
      ..lineTo(shapeBounds.topRight.dx, shapeBounds.topRight.dy)
      ..close(); //8

    canvas.drawPath(backgroundPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
