import 'package:wear_ongoing_activity/wear_ongoing_activity.dart';

void main() {
  WearOngoingActivity.update(
    OngoingActivityStatus(
      templates: [
        '#type#: #time#',
      ],
      parts: [
        TextPart(name: 'type', text: 'countdown'),
        TimerPart(
          name: 'time',
          timeZero: DateTime.now().add(const Duration(minutes: 5)),
        ),
      ],
    ),
  );
}
