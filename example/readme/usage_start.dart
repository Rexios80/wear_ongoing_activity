import 'package:wear_ongoing_activity/wear_ongoing_activity.dart';

void main() {
  WearOngoingActivity.start(
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
        TextPart(name: 'type', text: 'countup'),
        StopwatchPart(name: 'time', timeZero: DateTime.now()),
      ],
    ),
  );
}
