import 'package:flutter/material.dart';
class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Home'),),
       body: Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(

            controller: name,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(

            controller: phno,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: DropDownFormField(
              titleText: 'My workout',
              hintText: 'Please choose one',
              value: _myActivity,
              onSaved: (value) {
                setState(() {
                  _myActivity = value;
                });
              },
              onChanged: (value) {
                setState(() {
                  _myActivity = value;
                });
              },
              dataSource: [
                {
                  "display": "Running",
                  "value": "Running",
                },
                {
                  "display": "Climbing",
                  "value": "Climbing",
                },
                {
                  "display": "Walking",
                  "value": "Walking",
                },
                {
                  "display": "Swimming",
                  "value": "Swimming",
                },
                {
                  "display": "Soccer Practice",
                  "value": "Soccer Practice",
                },
                {
                  "display": "Baseball Practice",
                  "value": "Baseball Practice",
                },
                {
                  "display": "Football Practice",
                  "value": "Football Practice",
                },
              ],
              textField: 'display',
              valueField: 'value',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Validate returns true if the form is valid, or false otherwise.
              if (_formKey.currentState!.validate()) {
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.
                setState(() {
                  _myActivityResult = _myActivity;
                });
              }
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Processing Data')),

              );

            }, child: const Text("book now"),

          ),
        ],
      ),

    ),
    );
  }
}