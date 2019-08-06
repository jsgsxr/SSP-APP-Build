import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

import 'package:layout_practice/Services/contact.dart';
import 'package:layout_practice/Services/mailerapp.dart';

DateTime convertToDate(String input) {
  try {
    var d = new DateFormat.yMd().parseStrict(input);
    return d;
  } catch (e) {
    return null;
  }
}

bool isValidDob(String dob) {
  if (dob.isEmpty) return true;
  var d = convertToDate(dob);
  return d != null && d.isAfter(new DateTime.now());
}

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final TextEditingController dateController = new TextEditingController();
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController phoneController = new TextEditingController();
  final TextEditingController companyController = new TextEditingController();
  final TextEditingController positionController = new TextEditingController();
  final TextEditingController messageController = new TextEditingController();

  Future _chooseDate(BuildContext context, DateTime date) async {
    var result = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: date,
        lastDate: new DateTime(2050));

    if (result == null) return;

    setState(() {
      dateController.text = new DateFormat.yMd().format(result);
    });
  }

  ContactData newContact = new ContactData();
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
      key: _scaffoldKey,
      body: Container(
        child: Builder(
          builder: (context) => Form(
            autovalidate: true,
            key: _formKey,
            child: ListView(
              children: <Widget>[
                new TextFieldInput(Icons.assignment_ind, 'Name', 'First Last', nameController),
                TextFieldInput(Icons.email, 'Email', 'name@email.com', emailController),
                TextFieldInput(Icons.phone, 'Phone', '555-555-5555', phoneController),
                TextFieldInput(
                    Icons.domain, 'Company', 'Company Name(if applicable)', companyController),
                Container(
                    color: Colors.blueGrey[900],
                    child: ListTile(
                      leading: Container(
                        width: 40,
                        alignment: Alignment.center,
                        child: Icon(Icons.device_hub, color: Colors.white),
                      ),
                      title: DropdownButton(
                        style: TextStyle(
                            color: Colors.red[50],
                            backgroundColor: Colors.blueGrey[900]),
                        hint: Text('Your Company Position',
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
                    )),
                Container(
                  color: Colors.blueGrey[900],
                  child: new Row(children: <Widget>[
                    new Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: new TextFormField(
                        style: TextStyle(color: Colors.red[50]),
                        decoration: new InputDecoration(
                          fillColor: Colors.blueGrey[800],
                          filled: true,
                          icon: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: const Icon(
                              Icons.calendar_today,
                              color: Colors.white,
                            ),
                          ),
                          hintText: 'Your Projected Event Date',
                          hintStyle: TextStyle(color: Colors.red[50]),
                          labelText: 'Event Date',
                          labelStyle: TextStyle(color: Colors.red[50]),
                        ),
                        controller: dateController,
                        keyboardType: TextInputType.datetime,
                        validator: (val) =>
                            isValidDob(val) ? null : 'Not a valid date',
                      ),
                    )),
                    new IconButton(
                      icon: new Icon(Icons.more_horiz,
                      color: Colors.red[50],),
                      tooltip: 'Choose date',
                      onPressed: (() {
                        _chooseDate(context, DateTime.now());
                      }),
                    )
                  ]),
                ),
                Container(
                  color: Colors.blueGrey[900],
                  child: ListTile(
                    leading: Container(
                      width: 40,
                      alignment: Alignment.center,
                      child: Icon(Icons.assignment, color: Colors.white),
                    ),
                    title: Container(
                      margin: EdgeInsets.zero,
                      child: new TextField(
                        controller: messageController,
                        maxLines: 5,
                        style: TextStyle(
                          color: Colors.red[50],
                        ),
                        decoration: InputDecoration(
                          focusColor: Colors.red,
                          filled: true,
                          fillColor: Colors.blueGrey[800],
                          labelText: 'Your Message',
                          labelStyle: TextStyle(
                            color: Colors.red[50],
                          ),
                          hintText: 'Enter your message to us here!',
                          hintStyle: TextStyle(
                            color: Colors.red[50],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.only(top: 10.0, left: 120, right: 120, bottom: 10),
                  child: RaisedButton.icon(
                    icon: Icon(Icons.alternate_email),
                    label: Text('Send!'),
                    elevation: 5,
                    color: Colors.blue[900],
                    splashColor: Colors.cyan[900],
                    textColor: Colors.red[50],
                    onPressed: _submitForm,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showMessage(String message, [MaterialColor color = Colors.red]) {
    _scaffoldKey.currentState.showSnackBar(
        new SnackBar(backgroundColor: color, content: new Text(message)));
  }

  void _submitForm() {
    final FormState form = _formKey.currentState;
    final String body = 'Name: ' + nameController.text + 'Email: ' + emailController.text + 'Phone: ' + phoneController.text + 'Company: ' + companyController.text + 'Position: ' + positionController.text + 'Date: ' + dateController.text + 'Message: ' + messageController.text;

    if (!form.validate()) {
      showMessage('Form is not valid!  Please review and correct.');
    } else {
      form.save();
      EmailApp.sendEmail('jsgsxr@me.com', 'You have a new customer!', body);
      showMessage('Thanks! We will contact you shortly!');

      print('Form save called, newContact is now up to date...');
    }
  } 
}

class TextFieldInput extends StatelessWidget {
  TextFieldInput(
    this.iconInput,
    this.title,
    this.hint,
    this._newController
  );

  final IconData iconInput;
  final String title;
  final String hint;
  final TextEditingController _newController;

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
        title: new TextFormField(
          validator: (value) {
            if (value.isEmpty) {
              return 'Please Fill Every Field!';
            }
            return null;
          },
          controller: _newController,
          style: TextStyle(
            color: Colors.red[50],
          ),
          decoration: InputDecoration(
            focusColor: Colors.red,
            filled: true,
            fillColor: Colors.blueGrey[800],
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
