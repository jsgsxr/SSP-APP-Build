import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey();
  List<String> _positions = [
    'Owner/Operator',
    'Promoter',
    'Venue Management',
    'Talent Management',
    'Production Subcontractor',
    'Religious Leader',
    'Other'
  ];
  String _selectedPosition;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Builder(
          builder: (context) => Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                new TextFieldInput(Icons.assignment_ind, 'Name', 'First Last'),
                TextFieldInput(Icons.email, 'Email', 'name@email.com'),
                TextFieldInput(
                    Icons.domain, 'Company', 'Company Name(if applicable)'),
                Container(
                    color: Colors.blueGrey[900],
                    child: ListTile(
                      leading: Container(
                        width: 40,
                        alignment: Alignment.center,
                        child: Icon(Icons.device_hub, color: Colors.white),
                      ),
                      title: DropdownButton(
                        style: TextStyle(color: Colors.red[50],
                        backgroundColor: Colors.blueGrey[900]),
                        hint: Text(
                          'Your Company Position',
                          style: TextStyle(color: Colors.red[50])),
                        value: _selectedPosition,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedPosition = newValue;
                          });
                        },
                        items: _positions.map((position) {
                          return DropdownMenuItem(
                            child: new Text(position),
                            value: position,
                          );
                        }).toList(),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextFieldInput extends StatelessWidget {
  TextFieldInput(
    this.iconInput,
    this.title,
    this.hint,
  );

  final IconData iconInput;
  final String title;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey[900],
      child: ListTile(
        leading: Container(
          width: 40,
          alignment: Alignment.center,
          child: Icon(iconInput, color: Colors.white),
        ),
        title: new TextField(
          style: TextStyle(
            color: Colors.red[50],
          ),
          decoration: InputDecoration(
            focusColor: Colors.red,
            fillColor: Colors.red[50],
            labelText: title,
            labelStyle: TextStyle(
              color: Colors.red[50],
            ),
            hintText: hint,
            hintStyle: TextStyle(
              color: Colors.red[50],
            ),
          ),
        ),
      ),
    );
  }
}
