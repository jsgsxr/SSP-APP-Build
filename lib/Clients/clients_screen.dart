import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:layout_practice/Clients/bernie_screen.dart';
import 'package:layout_practice/Clients/cap_screen.dart';
import 'package:layout_practice/Clients/infinitus_screen.dart';
import 'package:layout_practice/Clients/wsav_screen.dart';

import 'package:layout_practice/Clients/clients_list_item.dart';
import 'package:layout_practice/welcome_screen.dart';

class Clients extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ClientsState();
  }
}

class _ClientsState extends State<Clients> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text(
          "Clients",
          style: TextStyle(fontFamily: 'Permanent Marker'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 65.0),
        child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) {
              return _clientsList()[index];
            }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: new CommonFAB(),
    );
  }
}

_clientsList() {
  return [
    ClientsListItem(
      name: 'WSAV Savannah NBC Affiliate',
      role: 'Live Broadcast Services',
      imageUrl: 'images/wsavgroup.jpg',
      route: WSAVInfo(),
    ),
    ClientsListItem(
      name: 'Capital A Productions',
      role: 'Technology Specialist',
      imageUrl: 'images/capitalagroup.jpg',
      route: CAPInfo(),
    ),
    ClientsListItem(
      name: 'Infinitus Global - 无限極',
      role: 'Audio Engineering',
      imageUrl: 'images/infinitus1.jpg',
      route: InfinitusInfo(),
    ),
    ClientsListItem(
      name: 'Bernie Sanders',
      role: 'Presidential Campaign Production',
      imageUrl: 'images/berniesanders1.jpg',
      route: BernieInfo(),
    ),
  ];
}
