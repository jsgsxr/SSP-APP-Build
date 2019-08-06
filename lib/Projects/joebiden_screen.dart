import 'package:flutter/material.dart';
import 'package:layout_practice/Services/map_screen.dart';
import 'package:layout_practice/welcome_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class BidenInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<BidenInfo> {
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
                    'Joe Biden 2016 Clinton Presidential Campaign',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue[300]),
                  ),
                ),
                Text('Southeastern United States',
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
                  const url = 'https://joebiden.com';
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
                  Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => MapScreen(38.897675, -77.036530, 'TheWhiteHouse')));
                },
                child: _buildButtonColumn(color, Icons.map, 'MAP')),
          ),
          
        ],
      ),
      color: Colors.grey[850],
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        'During the 2016 Clinton Presidential Campaign, Vice President Biden joined the campaign to help push his party further into power. The production team, made up from a combination of two different companies and local union staff, became responsible for most everything involved with these events. From the press risers, audio broadcasts, staging, and even cutting the letters for his backdrop from plywood. The level of security clearances and attention to detail was exciting and unexpected. Definitely a career highlight for everyone involved.',
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
          'Joe Biden 2016',
          style: TextStyle(fontFamily: 'Permanent Marker'),
        ),
      ),
      body: ListView(
        children: [
          Image.asset(
            'images/joebiden1.jpg',
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
