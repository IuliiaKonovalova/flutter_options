import 'dart:convert';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  Object? parameters;

  @override
  Widget build(BuildContext context) {
    parameters = ModalRoute.of(context)!.settings.arguments;
    Map data = jsonDecode(jsonEncode(parameters));
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
                Text('Edit Location'),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Image.asset('assets/${data['flag']}.png'),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                data['location'],
                style: const TextStyle(
                  fontSize: 28.0,
                  letterSpacing: 2.0,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          Text(
            data['time'],
            style: const TextStyle(
              fontSize: 66.0,
            ),
          ),
        ],
      )),
    );
  }
}
