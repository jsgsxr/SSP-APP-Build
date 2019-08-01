import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:layout_practice/contact_home_screen.dart';
import 'package:layout_practice/lzm_screen.dart';
import 'package:layout_practice/savjazzfest_screen.dart';
import 'package:layout_practice/welcome_screen.dart';

class Projects extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _ProjectsState();
  }
}

class _ProjectsState extends State<Projects> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text(
          "Projects",
          style: TextStyle(fontFamily: 'Permanent Marker'),
        ),
      ),
      body: GestureDetector(
        child: Hero(
          tag: 'imageHero',
          child: ListView(
            children: <Widget>[
              ProjectCards(
                  'images/lzmgroupphoto.jpg', 'LZM', 'Sound', LzmInfo()),
              ProjectCards(
                  'images/savannahjazzfest.jpg', 'LZM', 'Sound', SavJazzInfo()),
              ProjectCards('images/studioboard.jpg', 'LZM', 'Sound', LzmInfo()),
              ProjectCards(
                  'images/capitalagroup.jpg', 'LZM', 'Sound', LzmInfo()),
            ],
          ),
        ),
      ),
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
}

class ProjectCards extends StatefulWidget {
  ProjectCards(this.image, this.title, this.subtitle, this.link);

  final String image;
  final String title;
  final String subtitle;
  final Widget link;

  @override
  _ProjectCardsState createState() =>
      _ProjectCardsState(image, title, subtitle, link);
}

class _ProjectCardsState extends State<ProjectCards> {
  _ProjectCardsState(this.image, this.title, this.subtitle, this.link);

  final String image;
  final String title;
  final String subtitle;
  final Widget link;

  @override
  Widget build(BuildContext context) {
    return ListBody(children: <Widget>[
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => link,
            ),
          );
        },
        child: Container(
          child: InkWell(
            splashColor: Colors.blue[200],
            child: ListBody(
              children: <Widget>[
                CardColumn(image, title, subtitle),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}

class CardColumn extends StatefulWidget {
  CardColumn(this.image, this.title, this.subtitle);

  final String image;
  final String title;
  final String subtitle;

  @override
  _CardColumnState createState() => _CardColumnState(image, title, subtitle);
}

class _CardColumnState extends State<CardColumn> {
  _CardColumnState(this.image, this.title, this.subtitle);

  final String image;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _tileBuilder(image, title, subtitle),
      ],
    );
  }

  Center _tileBuilder(String image, String title, String subtitle) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(child: buildImage(image)),
          Container(
            alignment: Alignment.topCenter,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 3,
              ),
            ),
          ),
          Container(
            child: Text(
              subtitle,
              style: TextStyle(),
            ),
          ),
        ],
      ),
    );
  }

  Image buildImage(String image) {
    return Image.asset(
      '$image',
      width: 300,
      height: 200,
      fit: BoxFit.contain,
      alignment: Alignment.topCenter,
    );
  }
}
