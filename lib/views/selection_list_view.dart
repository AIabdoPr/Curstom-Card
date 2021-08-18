import 'package:flutter/material.dart';

class SelectionListView extends StatefulWidget {
  final List<String> values;
  Axis direction;
  int sleectedIndex;
  Function(int index) onSelect;

  SelectionListView(
      {required this.values,
      required this.onSelect,
      this.sleectedIndex = 0,
      this.direction = Axis.horizontal});

  @override
  _SelectionListViewState createState() => _SelectionListViewState();
}

class _SelectionListViewState extends State<SelectionListView> {
  int selectedItemIndex = 0;
  @override
  void initState() {
    super.initState();
    selectedItemIndex = widget.sleectedIndex;
  }

  void selectItem(int index) {
    setState(() {
      selectedItemIndex = index;
    });
    widget.onSelect(index);
  }

  Widget _bulidContent({required List<Widget> children}) {
    Widget child = widget.direction == Axis.horizontal
        ? Row(mainAxisAlignment: MainAxisAlignment.center, children: children)
        : Column(children: children);
    return child;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: EdgeInsets.symmetric(horizontal: 2, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Color(0X22CCCCCC)),
      child: SingleChildScrollView(
        scrollDirection: widget.direction,
        child: _bulidContent(
            children: List.generate(
                widget.values.length,
                (index) => Container(
                      padding: EdgeInsets.symmetric(horizontal: 3),
                      // decoration: BoxDecoration(
                      //     border: selectedItemIndex == index
                      //         ? Border(
                      //             bottom: BorderSide(
                      //                 color: Color(0XFFBB1C1C),
                      //                 width: 4,
                      //                 style: BorderStyle.solid))
                      //         : null),
                      child: Column(
                        children: [
                          TextButton(
                              onPressed: () => selectItem(index),
                              child: Text(
                                widget.values[index],
                                style: TextStyle(
                                  color: selectedItemIndex == index
                                      ? Color(0XFFBB1C1C)
                                      : Colors.grey,
                                  fontSize:
                                      selectedItemIndex == index ? 22 : 18,
                                  fontWeight: selectedItemIndex == index
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              )),
                          Container(
                            width: selectedItemIndex == index ? 25 : 0,
                            height: selectedItemIndex == index ? 5 : 0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0XFFBB1C1C)),
                          )
                        ],
                      ),
                    ))),
      ),
    );
  }
}
