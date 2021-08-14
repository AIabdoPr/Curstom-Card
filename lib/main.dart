import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_card/views/bottom_drawer_head_view.dart';
import 'package:custom_card/views/my_card_view.dart';
import 'package:bottom_drawer/bottom_drawer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[900],
      appBar: AppBar(
          title: Center(child: Text("Tickets")),
          backgroundColor: Colors.red[900]),
      body: Center(
        child: Stack(
          children: [
            CarouselSlider.builder(
              itemCount: 15,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      MyCardView(
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.78,
              ),
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.78,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {},
                scrollDirection: Axis.horizontal,
              ),
            ),
            _buildBottomDrawer(context),
          ],
        ),
      ),
    );
  }

  String _button = 'None';
  double _headerHeight = 70;
  double _bodyHeight = 500;
  BottomDrawerController _controller = BottomDrawerController();

  Widget _buildBottomDrawer(BuildContext context) {
    return BottomDrawer(
      header: _buildBottomDrawerHead(context),
      body: _buildBottomDrawerBody(context),
      headerHeight: _headerHeight,
      drawerHeight: _bodyHeight,
      color: Colors.transparent,
      controller: _controller,
    );
  }

  Widget _buildBottomDrawerHead(BuildContext context) {
    return Container(
      height: _headerHeight,
      child: Center(child: BottomDrawerHeadView(_controller)),
    );
  }

  Widget _buildBottomDrawerBody(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: _bodyHeight,
      color: Color(0XFFBB1C1C),
      child: SingleChildScrollView(
        child: Column(
          children: _buildButtons('Body', 1, 25),
        ),
      ),
    );
  }

  List<Widget> _buildButtons(String prefix, int start, int end) {
    List<Widget> buttons = [];
    for (int i = start; i <= end; i++)
      buttons.add(TextButton(
        child: Text(
          '$prefix Button $i',
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.black,
          ),
        ),
        onPressed: () {
          setState(() {
            _button = '$prefix Button $i';
          });
        },
      ));
    return buttons;
  }
}
