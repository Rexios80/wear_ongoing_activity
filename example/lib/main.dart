import 'package:flutter/material.dart';

import 'package:wear_ongoing_activity/wear_ongoing_activity.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  WearOngoingActivity.start(
    notificationId: 0,
    channelId: 'idk',
    status: OngoingActivityStatus(),
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
