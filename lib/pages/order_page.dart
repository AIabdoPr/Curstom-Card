
import 'package:custom_card/views/horizontal_spinner_view.dart';
import 'package:custom_card/views/my_time_picker_view.dart';
import 'package:custom_card/views/selection_list_view.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  List<String> selectionList = ["Inside", "Any", "Outside"];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Color(0XFFBB1C1C),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: <Widget>[
                    Image.asset("assets/images/location.png",
                        width: 50, height: 50),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        children: <Widget>[
                          MyTimePickerView(context),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
                          Text("to", style: TextStyle(color: Colors.white)),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
                          MyTimePickerView(context)
                        ],
                      ),
                    ),
                    Spacer(),
                    CircleAvatar(
                        backgroundColor: Colors.green,
                        foregroundColor: Color(0XFFBB1C1C),
                        child: Icon(Icons.phone))
                  ],
                ),
              ),
              SelectionListView(
                  onSelect: (index) => print(selectionList[index]),
                  values: selectionList,
                  sleectedIndex: 1),
              HorizontalSpinnerView(
                children: List.generate(10, (index) => index.toString()),
                initialIndex: 4,
                onChanged: (value) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
