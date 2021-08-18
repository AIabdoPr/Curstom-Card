import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTimePickerView extends StatefulWidget {
  BuildContext context;
  MyTimePickerView(this.context);

  @override
  _MyTimePickerViewState createState() => _MyTimePickerViewState();
}

class _MyTimePickerViewState extends State<MyTimePickerView> {
  int hour = 11, munit = 30;

  void onClicked(String type) {
    int valueSelected = type == "hour" ? hour : munit;
    AlertDialog alertDialog = AlertDialog(
      title: Text("Select " + type + "s"),
      content: Container(
        height: 200,
        child: CupertinoPicker(
          itemExtent: 30,
          scrollController:
              FixedExtentScrollController(initialItem: valueSelected - 1),
          onSelectedItemChanged: (int value) => valueSelected = value + 1,
          children: List.generate(type == "hour" ? 12 : 60,
              (index) => Text((index + 1).toString())),
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              setState(() {
                type == "hour" ? hour = valueSelected : munit = valueSelected;
              });
              Navigator.of(widget.context).pop();
            },
            child: Text("Accept")),
        TextButton(
            onPressed: () => Navigator.of(widget.context).pop(),
            child: Text("Cancel")),
      ],
    );

    showDialog(
      context: widget.context,
      builder: (BuildContext context) {
        return alertDialog;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          TextButton(
              style: TextButton.styleFrom(minimumSize: Size(30, 30)),
              onPressed: () => onClicked("hour"),
              child:
                  Text(hour.toString(), style: TextStyle(color: Colors.white))),
          Text(":", style: TextStyle(color: Colors.white)),
          TextButton(
              style: TextButton.styleFrom(minimumSize: Size(30, 30)),
              onPressed: () => onClicked("munit"),
              child: Text(munit.toString(),
                  style: TextStyle(color: Colors.white))),
        ],
      ),
    );
  }
}
