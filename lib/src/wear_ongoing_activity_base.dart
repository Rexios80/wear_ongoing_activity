import 'package:flutter/services.dart';
import 'package:wear_ongoing_activity/wear_ongoing_activity.dart';

/// Handle an ongoing activity on Wear OS.
class WearOngoingActivity {
  static const _channel = MethodChannel('wear_ongoing_activity');

  WearOngoingActivity._();

  static Future<void> start({
    required String notificationId,
    required String channelId,
    required OngoingActivityStatus status,
    NotificationCategory? category,
    String? smallIcon,
    String? animatedIcon,
    String? staticIcon,
  }) =>
      _channel.invokeMethod('start', {
        'notificationId': notificationId,
        'channelId': channelId,
        'status': status.toJson(),
        'category': category?.name,
        'smallIcon': smallIcon,
        'animatedIcon': animatedIcon,
        'staticIcon': staticIcon,
      });
}
