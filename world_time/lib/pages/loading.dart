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
  void setUpWorldTime() async {
    WorldTime instance = WorldTime(
      location: 'Berlin',
      flag: 'germany.png',
      urlTail: 'Europe/Berlin',
      time: '2:30',
      isDayTime: true,
    );
    await instance.getTimeData();
    // print everything
    print(instance.time);
    print(instance.flag);
    print(instance.location);
    print(instance.isDayTime);
    print(instance.urlTail);

    // Navigator.pushReplacementNamed(context, '/home', arguments: {
    //   'location': instance.location,
    //   'flag': instance.flag,
    //   'time': instance.time,
    //   'isDayTime': instance.isDayTime,
    // });
  }

  @override
  void initState() {
    super.initState();
    print('initState function ran');
    // setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
