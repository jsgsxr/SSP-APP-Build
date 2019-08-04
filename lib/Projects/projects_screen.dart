import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:layout_practice/Projects/elan_screen.dart';
import 'package:layout_practice/Projects/joebiden_screen.dart';

import 'package:layout_practice/Projects/projects_list_item.dart';
import 'package:layout_practice/Projects/lzm_screen.dart';
import 'package:layout_practice/Projects/savjazzfest_screen.dart';
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
      body: Padding(
        padding: const EdgeInsets.only(bottom: 65.0),
        child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return _projectsList()[index];
                }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: new CommonFAB(),
    );
  }

  _projectsList() {
    return [
      ProjectsListItem(
        name: 'Ling Zhong Culture Media',
        role: 'Production Systems Designer',
        imageUrl: 'images/lzmbuyerphoto.jpg',
        route: LzmInfo(),
      ),
      ProjectsListItem(
        name: 'Savannah Jazz Festival',
        role: 'Audio Engineering/Lighting Design',
        imageUrl: 'images/savannahjazzfest.jpg',
        route: SavJazzInfo(),
      ),
      ProjectsListItem(
        name: 'Joe Biden 2016 Clinton Campaign',
        role: 'Campaign Production Services',
        imageUrl: 'images/joebiden1.jpg',
        route: BidenInfo(),
      ),
      ProjectsListItem(
        name: 'Elan Savannah',
        role: 'Production Systems Design/Show Engineering',
        imageUrl: 'images/elansavannah1.jpg',
        route: ElanInfo(),
      ),
    ];
  }
}
