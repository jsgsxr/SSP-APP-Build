import 'package:flutter/material.dart';

class ProjectsListItem extends StatelessWidget {
  final String name;
  final String role;
  final String imageUrl;
  final Widget route;

  const ProjectsListItem(
      {Key key, this.name, this.role, this.imageUrl, this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buildProjectItemCard(context, route),
      ],
    );
  }

  _buildProjectItemCard(BuildContext context, Widget route) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) => route));
        },
        child: Card(
          color: Colors.blueGrey[800],
          elevation: 4,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Image.asset(imageUrl,
                fit: BoxFit.cover),
                height: 150,
                width: 300,
              ),
              Padding(
                padding: EdgeInsets.only(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        name,
                        style: TextStyle(fontSize: 14,
                        color: Colors.red[50]),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        role,
                        style: TextStyle(fontSize: 11,
                        color: Colors.red[200]),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
