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
    print(parameters);
    // data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    Map data = jsonDecode(jsonEncode(parameters));
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.blue[900],
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue[900],
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/location');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(Icons.edit_location),
                    Text('Edit Location'),
                  ],
                ),
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 20.0),
                Image.asset('assets/images/flags/${data['flag']}',
                    height: 64.0),
                const SizedBox(height: 20.0),
                Text(
                  data['location'],
                  style: const TextStyle(
                    fontSize: 28.0,
                    letterSpacing: 2.0,
                  ),
                ),
                const SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: const TextStyle(
                    fontSize: 66.0,
                  ),
                ),
                Text(
                  data['isDaytime'],
                  style: const TextStyle(
                    fontSize: 66.0,
                  ),
                ),
              ],
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
