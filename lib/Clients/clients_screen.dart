import 'package:flutter/material.dart';

import 'package:layout_practice/welcome_screen.dart';

class Clients extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _ClientsState();
  }
}

class _ClientsState extends State<Clients> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text(
          "Clients",
          style: TextStyle(fontFamily: 'Permanent Marker'),
        ),
      ),
      body: ListView(children: [
        Container(
          padding: EdgeInsets.only(top: 30, bottom: 18),
          child: Text(
            'Sound, Lights, Video, and More!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'JosefinSans',
              fontWeight: FontWeight.bold,
              color: Colors.red[50],
              fontSize: 23,
            ),
          ),
        ),
        WelcomeImages(),
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: new CommonFAB(),
    );
  }
}