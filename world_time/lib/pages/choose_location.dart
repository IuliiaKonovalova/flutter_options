import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;

  void getTimeData() async {
    Response response = await get(Uri.parse(
        "https://timeapi.io/api/Time/current/zone?timeZone=Europe/Amsterdam"));
    Map data = jsonDecode(response.body);
    print(data);
    print(data['dateTime']);
    print(data['date']);
    print(data['dayOfWeek']);
  }

  @override
  void initState() {
    super.initState();
    print('initState function ran');
    getTimeData();
  }

  @override
  Widget build(BuildContext context) {
    print('build function ran');
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text('Choose a location'),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        elevation: 0,
      ),
      body: ElevatedButton(
        onPressed: () {
          setState(() {
            counter += 1;
            print(counter);
          });
        },
        child: Text('counter is $counter'),
      ),
    );
  }
}
