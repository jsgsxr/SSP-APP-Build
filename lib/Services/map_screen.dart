import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:layout_practice/welcome_screen.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> markers = {
    Marker(
      markerId: MarkerId('value'),
      position: LatLng(32.0809, -81.0912),
      infoWindow: InfoWindow(
        title: 'SilverSmith Productions',
        snippet: 'Savannah, Georgia',
      ),
    ),
  };

  static const LatLng _center = const LatLng(32.0809, -81.0912);

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
          target: _center,
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
          onPressed: _launchMaps,
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

  _launchMaps() async {
    const url =
        "https://www.google.com/maps/search/?api=1&query_place_id=SAVANNAH_GA";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch Maps';
    }
  }
}
