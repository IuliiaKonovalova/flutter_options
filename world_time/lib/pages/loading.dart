import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading';
  Future<void> setUpWorldTime() async {
    WorldTime instance = WorldTime(
      location: 'Berlin',
      flag: 'germany.png',
      urlTail: 'Europe/Berlin',
      time: '',
    );
    await instance.getTimeData();
    setState(() {
      time = instance.time;
    });
  }

  @override
  void initState() {
    super.initState();
    print('initState function ran');
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Text(time),
      ),
    );
  }
}
