import 'package:wear_ongoing_activity/wear_ongoing_activity.dart';

void main() async {
  if (!await WearOngoingActivity.isOngoing()) {
    // Attempting to update an activity that is not ongoing will throw an error
    return;
  }

  await WearOngoingActivity.update(
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
