import 'package:flutter/material.dart';

import 'package:layout_practice/aboutus_screen.dart';
import 'package:layout_practice/clients_screen.dart';
import 'package:layout_practice/contactform_screen.dart';
import 'package:layout_practice/projects_screen.dart';
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
      drawer: Drawer(
        semanticLabel: 'Navigation',
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blueGrey[500],
                ),
                color: Color(0xFF0D47A1),
              ),
              child: Container(
                child: Row(children: [
                  CircleAvatar(),
                ]),
              ),
            ),
            _navRouteBuilder(context, Icons.home, 'Home', Welcome()),
            _navRouteBuilder(
                context, Icons.library_music, 'Projects', Projects()),
            _navRouteBuilder(
                context, Icons.recent_actors, 'Clients', Clients()),
            _navRouteBuilder(context, Icons.contacts, 'Contact', Contact())
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          "Contact",
          style: TextStyle(fontFamily: 'Permanent Marker'),
        ),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
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

  InkWell _navRouteBuilder(
      BuildContext context, IconData _icon, String _title, Widget _screen) {
    return InkWell(
      splashColor: Colors.blue,
      onTap: () {
        Navigator.of(context).pop();
        Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => _screen));
      },
      child: ListTile(
        leading: Icon(_icon, color: Colors.red[50]),
        title: Text(_title, style: TextStyle(color: Colors.red[50])),
      ),
    );
  }
}
