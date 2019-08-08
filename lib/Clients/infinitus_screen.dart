import 'package:flutter/material.dart';
import 'package:layout_practice/Services/map_screen.dart';
import 'package:layout_practice/welcome_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class InfinitusInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<InfinitusInfo> {
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
                    'Infinitus Global - 无限極',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue[300]),
                  ),
                ),
                Text('Beijing China/Worldwide',
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
                  const url = 'https://www.infinitus-int.com/';
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }},
                child: _buildButtonColumn(color, Icons.language, 'VISIT')),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
                splashColor: Colors.blueAccent,
                onTap: () {
                  Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => MapScreen(39.904202, 116.407394, 'BeijingChina')));
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
        'LKK Health Products Group (LKKHPG) is part of the century-old Lee Kum Kee Group. Headquartered in Hong Kong, LKKHPG is a large-scale enterprise specializing in R&D, production and sale of Chinese herbal health products. LKKHPG consists of 4 divisions with a total of over 3000 employees: Infinitus (China) Company Ltd, Infinitus (Hong Kong) Company Ltd, Infinitus International Company Ltd, and Infinitus (Malaysia) Sdn Bhd. The China division was established in Guangzhou in 1992 and has since then set up 36 branches, 28 service centers and nearly 5000 exclusive stores in Mainland China.',
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
          'Infinitus - 无限極',
          style: TextStyle(fontFamily: 'Permanent Marker'),
        ),
      ),
      body: ListView(
        children: [
          Image.asset(
            'images/infinitus1.jpg',
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