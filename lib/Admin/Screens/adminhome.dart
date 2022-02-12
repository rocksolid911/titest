import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:titest/Admin/model/movie.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController time = TextEditingController();
  TextEditingController tquantity = TextEditingController();
  TextEditingController tprice = TextEditingController();
  late String _movie;
  late String _movieresult;
  List<Movie> movielist = [
    Movie("one", 200, '10/2/2022', 20),
    Movie('two', 250, '12/2/2022', 30),
    Movie('three', 300, '/13/2/2022', 40),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Home'),
      ),
      body: Form(
          key: _formKey,
          child: ListView.builder(
              itemCount: movielist.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        label: Text('${movielist[index].moviename}'),
                      ),
                      controller: name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          value = name.text;
                        });
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        label: Text('${movielist[index].tquant}'),
                      ),
                      controller: tquantity,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          value = tquantity.text;
                        });
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        label: Text('${movielist[index].tprice}'),
                      ),
                      controller: tprice,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          value = tprice.text;
                        });
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        label: Text('${movielist[index].time}'),
                      ),
                      controller: time,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          value = time.text;
                        });
                      },
                    ),
                  ],
                );
              })),
    );
  }
}
