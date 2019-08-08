import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MapScreen extends StatefulWidget {
  final double lat;
  final double lon;
  final String location;

  MapScreen(this.lat, this.lon, this.location);

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<MapScreen> {
  

Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

void _markers() {

  final MarkerId markerId = MarkerId(widget.location);
  final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(widget.lat, widget.lon),
      infoWindow: InfoWindow(title: widget.location)
      );
      setState(() {
        markers[markerId] = marker;
      }); 
}

  _MapState();

  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title:
            Text('Locations', style: TextStyle(fontFamily: 'Permanent Marker')),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.lat, widget.lon),
          zoom: 15.0,
        ),
        markers: Set<Marker>.of(markers.values),
        scrollGesturesEnabled: true,
        myLocationEnabled: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: FloatingActionButton(
          onPressed: _launchMaps,
          tooltip: 'Route',
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
    _markers();
  }

  _launchMaps() async {
    var url = "https://www.google.com/maps/search/?api=1&query=${widget.location}";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch Maps';
    }
  }
}