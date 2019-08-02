import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:layout_practice/welcome_screen.dart';

class MapScreen extends StatefulWidget {
MapScreen(this.lat, this.lon);

  final double lat;
  final double lon;

  @override
  _MapState createState() => _MapState(lat, lon);
}

class _MapState extends State<MapScreen> {
  _MapState(lat, lon);

static double lat;
static double lon;

  Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> markers = {
    Marker(
      markerId: MarkerId('value'),
      position: LatLng(lat, lon),
      infoWindow: InfoWindow(
        title: 'SilverSmith Productions',
        snippet: 'Savannah, Georgia',
      ),
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: new AppDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title:
            Text('Locations', style: TextStyle(fontFamily: 'Permanent Marker')),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(lat, lon),
          zoom: 11.0,
        ),
        markers: markers,
        scrollGesturesEnabled: true,
        myLocationEnabled: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: FloatingActionButton(
          onPressed: _launchMaps(lat, lon),
          tooltip: 'Contact Us!',
          child: Icon(Icons.directions),
          elevation: 10,
          foregroundColor: Colors.red[50],
          backgroundColor: Colors.blue[900],
        ),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  _launchMaps(lat, lon) async {
    const url =
        "https://www.google.com/maps/search/?api=1&query=lat,lon";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch Maps';
    }
  }
}
