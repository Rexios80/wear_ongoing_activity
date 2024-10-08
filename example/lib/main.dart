import 'dart:async';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wear_ongoing_activity/wear_ongoing_activity.dart';

void main() {
  runApp(const MaterialApp(home: MyHomePage()));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _counter = 0;
  var _ongoing = false;
  Timer? _updateTimer;

  OngoingActivityStatus get _status => OngoingActivityStatus(
        templates: [
          '#label#: #count#',
        ],
        parts: [
          TextPart(name: 'label', text: 'Count'),
          TextPart(name: 'count', text: '$_counter'),
        ],
      );

  void _start() async {
    setState(() => _ongoing = true);
    await WearOngoingActivity.start(
      channelId: 'ongoing_activity',
      channelName: 'Ongoing Activity',
      notificationId: 12345,
      category: NotificationCategory.workout,
      smallIcon: 'ic_launcher',
      staticIcon: 'ic_launcher',
      status: _status,
    );

    _updateTimer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) async {
        setState(() => _counter++);

        // If the activity is not started yet, return and try again later
        if (!await WearOngoingActivity.isOngoing()) return;
        unawaited(WearOngoingActivity.update(_status));
      },
    );
  }

  void _stop() async {
    setState(() => _ongoing = false);
    await WearOngoingActivity.stop();
    _updateTimer?.cancel();
  }

  @override
  void initState() {
    super.initState();

    [Permission.notification, Permission.sensors].request();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            if (_ongoing)
              IconButton(icon: const Icon(Icons.stop), onPressed: _stop)
            else
              IconButton(
                icon: const Icon(Icons.play_arrow),
                onPressed: _start,
              ),
          ],
        ),
      ),
    );
  }
}
