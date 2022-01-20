import 'package:connect_with_device_calender/calendar_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:manage_calendar_events/manage_calendar_events.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CheckDeviceCalendars(),
    );
  }
}

class CheckDeviceCalendars extends StatelessWidget {
  CheckDeviceCalendars({Key? key}) : super(key: key);
  final CalendarPlugin _myPlugin = CalendarPlugin();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _myPlugin.hasPermissions().then((value) {
              if (!value!) {
                _myPlugin.requestPermissions();
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CalendarListScreen()));
              }
            });
          },
          child: const Text('Show Calendars'),
        ),
      ),
    );
  }
}
