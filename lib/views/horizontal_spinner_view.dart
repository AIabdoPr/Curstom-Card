// Real source : https://github.com/levent-kantaroglu/horizontal_picker
// Edited by Abdo-Pr

import 'package:flutter/material.dart';
import 'horizontal_spinner_item_view.dart';

enum InitialPosition { start, center, end }

class HorizontalSpinnerView extends StatefulWidget {
  final List<String> children;
  final int initialIndex;
  final Function(int) onChanged;
  final Color backgroundColor,
      textColor,
      cursorBackgroundColor,
      cursorFourgoundColor;

  HorizontalSpinnerView({
    required this.children,
    required this.initialIndex,
    required this.onChanged,
    this.backgroundColor = Colors.transparent,
    this.textColor = Colors.grey,
    this.cursorBackgroundColor = const Color(0XFFBB1C1C),
    this.cursorFourgoundColor = Colors.white,
  });

  @override
  _HorizontalSpinnerViewState createState() => _HorizontalSpinnerViewState();
}

class _HorizontalSpinnerViewState extends State<HorizontalSpinnerView> {
  late FixedExtentScrollController _scrollController;
  late String curItem;
  late List<HorizontalSpinnerItemView> children;

  @override
  void initState() {
    super.initState();

    curItem = widget.children[widget.initialIndex];

    children = List.generate(
        widget.children.length,
        (index) => HorizontalSpinnerItemView(
              child: widget.children[index],
            ));

    _scrollController =
        FixedExtentScrollController(initialItem: widget.initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      margin: const EdgeInsets.all(20),
      height: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.backgroundColor),
      child: Stack(
        children: <Widget>[
          RotatedBox(
            quarterTurns: 3,
            child: ListWheelScrollView(
              controller: _scrollController,
              itemExtent: 60,
              onSelectedItemChanged: (index) {
                setState(() {
                  curItem = widget.children[index];
                });
              },
              children: List.generate(widget.children.length, (index) {
                return HorizontalSpinnerItemView(
                  child: widget.children[index],
                  textColor: widget.textColor,
                );
              }),
            ),
          ),
          Visibility(
            visible: true,
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(Icons.airplay, size: 65),
                  // Text(curItem,
                  //     style: TextStyle(
                  //         color: widget.cursorFourgoundColor,
                  //         fontSize: 25,
                  //         fontWeight: FontWeight.bold))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
