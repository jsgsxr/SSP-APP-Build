import 'package:flutter/material.dart';
import 'package:layout_practice/Services/map_screen.dart';
import 'package:layout_practice/welcome_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class BernieInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<BernieInfo> {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Bernie Sanders Presidential Campaign ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue[300]),
                  ),
                ),
                Text('Southeastern US',
                    style: TextStyle(
                      color: Colors.blue[600],
                    ))
              ],
            ),
          ),
          FavoriteWidget(),
        ],
      ),
      color: Colors.grey[850],
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
                splashColor: Colors.blueAccent,
                onTap: () async {
                  const url = 'https://berniesanders.com/';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                child: _buildButtonColumn(color, Icons.language, 'VISIT')),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
                splashColor: Colors.blueAccent,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          MapScreen(35.227085, -80.843124, 'CharlotteNC')));
                },
                child: _buildButtonColumn(color, Icons.map, 'MAP')),
          ),
          Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Colors.blueAccent,
                onTap: () {},
                child: _buildButtonColumn(color, Icons.share, 'SHARE'),
              ))
        ],
      ),
      color: Colors.grey[850],
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        'In a partnership with ACS from Charlotte, North Carolina,',
        softWrap: true,
        style: TextStyle(
          color: Colors.red[50],
        ),
      ),
      color: Colors.grey[850],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bernie Sanders',
          style: TextStyle(fontFamily: 'Permanent Marker'),
        ),
      ),
      body: ListView(
        children: [
          Image.asset(
            'images/berniesanders1.jpg',
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
          titleSection,
          buttonSection,
          Padding(
            padding: const EdgeInsets.only(bottom: 100.0),
            child: textSection,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: new CommonFAB(),
    );
  }
}

Column _buildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Colors.blue,
          ),
        ),
      ),
    ],
  );
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;
  // ···
  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_isFavorited
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 25,
          child: Container(
            child: Text(
              '$_favoriteCount',
              style: TextStyle(
                color: Colors.red[50],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
