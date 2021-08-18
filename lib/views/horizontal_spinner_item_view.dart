import 'package:flutter/material.dart';

class HorizontalSpinnerItemView extends StatefulWidget {
  final String child;
  final Color textColor;
  final double fontSize, acitveFontSize;

  const HorizontalSpinnerItemView({
    required this.child,
    this.textColor = Colors.grey,
    this.fontSize = 18,
    this.acitveFontSize = 20,
  });

  @override
  _HorizontalSpinnerItemViewState createState() =>
      _HorizontalSpinnerItemViewState();
}

class _HorizontalSpinnerItemViewState extends State<HorizontalSpinnerItemView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
      color: Colors.transparent,
      alignment: Alignment.center,
      child: RotatedBox(
        quarterTurns: 1,
        child: Text(
          widget.child,
          style: TextStyle(
            color: widget.textColor,
            fontSize: widget.fontSize,
          ),
        ),
      ),
    );
  }
}
