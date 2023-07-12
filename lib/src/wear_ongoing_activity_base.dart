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
        ...status.toJson(),
        'category': category?.name,
        'smallIcon': smallIcon,
        'animatedIcon': animatedIcon,
        'staticIcon': staticIcon,
      });

  static Future<void> update(OngoingActivityStatus status) =>
      _channel.invokeMethod('update', status.toJson());
  
  static Future<void> stop() => _channel.invokeMethod('stop');
}
