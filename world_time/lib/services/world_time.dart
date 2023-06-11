import 'dart:convert';
import 'package:http/http.dart';

class WorldTime {
  String location; // location name for the UI
  String time;
  String flag;
  String urlTail;

  WorldTime({
    required this.location,
    required this.flag,
    required this.urlTail,
    required this.time,
  });

  Future<void> getTimeData() async {
    Response response = await get(Uri.parse(
        "https://timeapi.io/api/Time/current/zone?timeZone=$urlTail"));
    Map data = jsonDecode(response.body);
    print(data);
    print(data['dateTime']);
    print(data['date']);
    print(data['dayOfWeek']);
    String dateTime = data['dateTime'];
    String date = data['date'];
    String dayOfWeek = data['dayOfWeek'];
    String timeApi = data['time'];
    DateTime now = DateTime.parse(dateTime);
    print('time is $timeApi');
    print(now);
    print(now.year);
    print(now.month);
    print(now.day);
    print(now.hour);
    print(now.minute);
    // set the time property
    time = now.toString();
    print(time);
  }
}

WorldTime instance = WorldTime(
  location: 'Berlin',
  flag: 'germany.png',
  urlTail: 'Europe/Berlin',
  time: '',
);
