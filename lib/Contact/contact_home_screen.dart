import 'package:flutter/material.dart';

import 'package:layout_practice/Contact/aboutus_screen.dart';
import 'package:layout_practice/Contact/contactform_screen.dart';
import 'package:layout_practice/welcome_screen.dart';

class Contact extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _ContactState();
  }
}

class _ContactState extends State<Contact> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    ContactForm(),
    AboutUs(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text(
          "Contact",
          style: TextStyle(fontFamily: 'Permanent Marker'),
        ),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.red[100],
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.email),
            title: new Text('Contact Us'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.contacts), title: Text('About Us'))
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
