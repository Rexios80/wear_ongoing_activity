# wear_ongoing_activity

A new Flutter plugin project.

## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter development, view the
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


```xml
<uses-permission android:name="android.permission.FOREGROUND_SERVICE" />

<application>
    ...
    <service
        android:name="dev.rexios.wear_ongoing_activity.OngoingActivityService"
        android:exported="false"
        android:foregroundServiceType="location|mediaPlayback|... (optional)"
        android:stopWithTask="true" />
    ...
</application>
```