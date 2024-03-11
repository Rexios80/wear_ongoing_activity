import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:wear_ongoing_activity/wear_ongoing_activity.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Permission.notification.request();

  await WearOngoingActivity.start(
    channelId: 'ongoing_activity',
    channelName: 'Ongoing Activity',
    notificationId: 12345,
    category: NotificationCategory.workout,
    smallIcon: 'ic_launcher',
    staticIcon: 'ic_launcher',
    status: OngoingActivityStatus(
      templates: [
        '#type#: #time#',
      ],
      parts: [
        TextPart(name: 'type', text: 'stuff'),
        StopwatchPart(name: 'time', timeZero: DateTime.now()),
      ],
    ),
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
