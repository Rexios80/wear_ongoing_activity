# wear_ongoing_activity

Create and maintain ongoing activity notifications on Wear OS

## Getting Started

AndroidManifest.xml
```xml
<!-- Add permissions for the types specified in `foregroundServiceType` below -->
<uses-permission android:name="android.permission.FOREGROUND_SERVICE_HEALTH" />
<uses-permission android:name="android.permission.FOREGROUND_SERVICE_REMOTE_MESSAGING" />

<application>
    ...
    <service
        android:name="dev.rexios.wear_ongoing_activity.OngoingActivityService"
        android:exported="false"
        android:foregroundServiceType="health|remoteMessaging|..."
        android:stopWithTask="true" />
    ...
</application>
```

Make sure to request notification permission before starting an activity

<!-- embedme example/readme/getting_started.dart -->
```dart
import 'package:permission_handler/permission_handler.dart';

void main() async {
  await Permission.notification.request();
}

```

## Usage

Start an activity
<!-- embedme example/readme/usage_start.dart -->
```dart
import 'package:wear_ongoing_activity/wear_ongoing_activity.dart';

void main() {
  WearOngoingActivity.start(
    channelId: 'ongoing_activity',
    channelName: 'Ongoing Activity',
    notificationId: 12345,
    category: NotificationCategory.workout,
    foregroundServiceTypes: {
      ForegroundServiceType.health,
      ForegroundServiceType.remoteMessaging,
    },
    smallIcon: 'ic_launcher',
    staticIcon: 'ic_launcher',
    status: OngoingActivityStatus(
      templates: [
        '#type#: #time#',
      ],
      parts: [
        TextPart(name: 'type', text: 'countup'),
        StopwatchPart(name: 'time', timeZero: DateTime.now())
      ],
    ),
  );
}
```

Update an activity
<!-- embedme example/readme/usage_update.dart -->
```dart
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
        )
      ],
    ),
  );
}

```

Stop an activity
<!-- embedme example/readme/usage_stop.dart -->
```dart
import 'package:wear_ongoing_activity/wear_ongoing_activity.dart';

void main() {
  WearOngoingActivity.stop();
}

```