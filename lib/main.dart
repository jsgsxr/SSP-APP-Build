import 'package:flutter/material.dart';

import 'package:layout_practice/welcome_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SilverSmith Productions',
      theme: ThemeData(
        fontFamily: 'WorkSans',
        canvasColor: Colors.blueGrey[900],
        primaryColor: Colors.blue[900],
        accentColor: Colors.blueAccent,
        secondaryHeaderColor: Colors.blue[800],
        scaffoldBackgroundColor: Colors.black45,
        backgroundColor: Colors.black,
        textSelectionColor: Colors.deepOrange[50],
        textSelectionHandleColor: Colors.green[500],
      ),
      home: Welcome(),
    );
  }
}
