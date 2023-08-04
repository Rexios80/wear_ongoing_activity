import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:wear_ongoing_activity/wear_ongoing_activity.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Permission.notification.request();

  await WearOngoingActivity.start(
    notificationId: 12345,
    channelId: 'idk',
    status: OngoingActivityStatus(
      templates: [
        'Hello World',
      ],
      parts: [
        TextPart(name: 'type', text: 'Hello World'),
        StopwatchPart(name: 'time', timeZero: DateTime.now())
      ],
    ),
    staticIcon: 'ic_launcher',
    smallIcon: 'ic_launcher',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
