import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[
          OutlinedButton(
              onPressed: () {
                print('you clicked me');
                Navigator.pushNamed(context, '/location');
              },
              child: Row(
                children: const <Widget>[
                  Icon(Icons.edit_location),
                  Text('Edit Location')
                ],
              )),
        ],
      )),
    );
  }
}
