import 'package:flutter/material.dart';

class SavJazzInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<SavJazzInfo> {
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
                    'Savannah Jazz Festival',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue[300]),
                  ),
                ),
                Text('Savannah, Georgia',
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
          _buildButtonColumn(color, Icons.call, 'CALL'),
          _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(color, Icons.share, 'SHARE'),
        ],
      ),
      color: Colors.grey[850],
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        'SilverSmith Productions is a homegrown, experienced group based out of historic Savannah, Georgia. Started by a Savannah native, they have strived to bring the magic of production, be it lights, sound, or creative video, to all who wish to be creative, but need that extra push. With a love for the industry, and a love for artistry of all types, no challenge is too great for their expertise.',
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
          'Savannah Jazz Fest',
          style: TextStyle(fontFamily: 'Permanent Marker'),
        ),
      ),
      body: ListView(
        children: [
          Image.asset(
            'images/savannahjazzfest.jpg',
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
          titleSection,
          buttonSection,
          textSection,
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.mail),
            title: new Text('Messages'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.contacts), title: Text('About Us'))
        ],
      ),
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
