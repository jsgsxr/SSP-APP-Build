import 'package:flutter/material.dart';
import 'package:layout_practice/Services/map_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:layout_practice/Clients/clients_screen.dart';
import 'package:layout_practice/Contact/contact_home_screen.dart';
import 'package:layout_practice/Projects/projects_screen.dart';

class Welcome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: new AppDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
          "SilverSmith Productions",
          style: TextStyle(fontFamily: 'Permanent Marker', fontSize: 15),
        ),
      ),
      body: ListView(children: [
        Container(
          padding: EdgeInsets.only(top: 20, bottom: 20),
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

class CommonFAB extends StatelessWidget {
  const CommonFAB({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) => Contact()));
        },
        tooltip: 'Contact Us!',
        icon: Icon(Icons.email),
        label: Text('Contact Us!'),
        elevation: 10,
        foregroundColor: Colors.red[50],
        backgroundColor: Colors.blue[900],
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      semanticLabel: 'Navigation',
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('images/studioboard.jpg')),
              border: Border.all(
                color: Colors.blueGrey[500],
              ),
              color: Color(0xFF0D47A1),
            ),
            child: Stack(children: <Widget>[
              Positioned(
                bottom: 2,
                right: 7,
                child: Row(children: [
                  Text(
                    'SilverSmith Productions',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Permanent Marker',
                      fontSize: 20,
                    ),
                  ),
                ]),
              ),
            ]),
          ),
          _navRouteBuilder(context, Icons.home, 'Home', Welcome()),
          Divider(
            color: Colors.red[50],
          ),
          _navRouteBuilder(
              context, Icons.library_music, 'Projects', Projects()),
          _navRouteBuilder(context, Icons.recent_actors, 'Clients', Clients()),
          _navRouteBuilder(context, Icons.contacts, 'Contact', Contact()),
          Divider(
            color: Colors.red[50],
          ),
          _navRouteBuilder(context, Icons.navigation, 'Location',
              MapScreen(32.0809, -81.0912, 'Savannah,GA')),
        ],
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

final List<String> imgList = [
        'images/doubleslogo.png',
        'images/savannahjazzfest.jpg',
        'images/thedooverscreenshot.png',
        'images/wsavgroup.jpg',
        'images/studioboard.jpg',
        'images/capitalagroup.jpg'
      ];
class WelcomeImages extends StatefulWidget {
  @override
  _WelcomeImagesState createState() => _WelcomeImagesState();
}

class _WelcomeImagesState extends State<WelcomeImages> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      height: 500,
      viewportFraction: .8,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 4),
      autoPlayAnimationDuration: Duration(milliseconds: 800),
      autoPlayCurve: Curves.easeInOut,
      pauseAutoPlayOnTouch: Duration(seconds: 10),
      enlargeCenterPage: true,
      scrollDirection: Axis.horizontal,
      items: imgList.map((img) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(color: Colors.blueGrey[800]),
              child: Image.asset(
                img,
                fit: BoxFit.cover,
                width: 600,
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
