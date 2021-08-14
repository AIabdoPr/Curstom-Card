import 'dart:math';
import 'dart:ui' as ui;

import 'package:bottom_drawer/bottom_drawer.dart';
import 'package:flutter/material.dart';

class BottomDrawerHeadView extends StatefulWidget {
  final BottomDrawerController bottomDrawerController;
  BottomDrawerHeadView(this.bottomDrawerController);

  @override
  _BottomDrawerHeadViewState createState() => _BottomDrawerHeadViewState();
}

class _BottomDrawerHeadViewState extends State<BottomDrawerHeadView> {
  bool isClosed = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: CustomPaint(
        painter: HeadCustomPainter(),
        child: Column(
          children: <Widget>[
            Text(
              "My Queue",
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            IconButton(
                onPressed: () => setState(() {
                      isClosed = !isClosed;
                      isClosed
                          ? widget.bottomDrawerController.close()
                          : widget.bottomDrawerController.open();
                    }),
                icon: Icon(
                    isClosed ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                    color: Colors.white))
          ],
        ),
      ),
    );
  }
}

class HeadCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..shader = ui.Gradient.linear(Offset(size.width / 2, 0),
          Offset(size.width / 2, 100), [Color(0XFFBB3C3C), Color(0XFFBB1C1C)]);

    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height - 35),
        height: 120,
        width: size.width,
      ),
      0,
      -pi,
      true,
      paint,
    );

    Rect rect = Rect.fromLTWH(0, size.height - 35, size.width, 35);
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
