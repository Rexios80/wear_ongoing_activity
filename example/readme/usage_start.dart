import 'package:wear_ongoing_activity/wear_ongoing_activity.dart';

void main() {
  WearOngoingActivity.start(
    channelId: 'ongoing_activity',
    channelName: 'Ongoing Activity',
    notificationId: 12345,
    category: NotificationCategory.workout,
    // This must be a file in `android/app/src/main/res/drawable`
    smallIcon: 'ic_launcher',
    // This must be a file in `android/app/src/main/res/drawable`
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
