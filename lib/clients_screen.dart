import 'package:flutter/material.dart';
import 'package:layout_practice/contact_home_screen.dart';
import 'package:layout_practice/projects_screen.dart';

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
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => Contact()));
          },
          tooltip: 'Contact Us!',
          icon: Icon(Icons.email),
          label: Text('Contact Us!'),
          elevation: 10,
          foregroundColor: Colors.red[50],
          backgroundColor: Colors.blue[900],
        ),
      ),
    );
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