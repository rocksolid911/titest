import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';

class BookTicket extends StatefulWidget {
  const BookTicket({Key? key}) : super(key: key);

  @override
  _BookTicketState createState() => _BookTicketState();
}

class _BookTicketState extends State<BookTicket> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController phno = TextEditingController();
  TextEditingController tquantity = TextEditingController();
  TextEditingController movie  = TextEditingController();
  late String _movie;
  late String _movieresult;

  @override
  void initState() {
    super.initState();
    _movie = '';
    _movieresult = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Book Ticket'),),
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
                value: _movie,
                onSaved: (value) {
                  setState(() {
                    _movie = value;
                  });
                },
                onChanged: (value) {
                  setState(() {
                    _movie = value;
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
    _movieresult = _movie;
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
