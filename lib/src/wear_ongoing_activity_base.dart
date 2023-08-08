import 'package:flutter/services.dart';
import 'package:wear_ongoing_activity/src/convert.dart';
import 'package:wear_ongoing_activity/wear_ongoing_activity.dart';

/// Handle an ongoing activity on Wear OS.
class WearOngoingActivity {
  static const _channel = MethodChannel('wear_ongoing_activity');

  WearOngoingActivity._();

  /// Start an ongoing activity
  /// 
  /// - [channelId]: The id of the notification channel
  /// - [channelName]: The name of the notification channel
  /// - [notificationId]: The id of the notification
  /// - [category]: The category of the notification
  /// - [smallIcon]: The name of the small icon resource
  /// - [staticIcon]: The name of the static icon resource
  /// - [animatedIcon]: The name of the animated icon resource
  /// - [status]: The status of the ongoing activity
  static Future<void> start({
    required String channelId,
    required String channelName,
    required int notificationId,
    NotificationCategory? category,
    required String smallIcon,
    required String staticIcon,
    String? animatedIcon,
    required OngoingActivityStatus status,
  }) =>
      _channel.invokeMethod('start', {
        'channelId': channelId,
        'channelName': channelName,
        'notificationId': notificationId,
        'category': category?.name,
        'smallIcon': smallIcon,
        'staticIcon': staticIcon,
        'animatedIcon': animatedIcon,
        ...jsonMapEncode(status.toJson()),
      });

  /// Update an ongoing activity with a new status
  static Future<void> update(OngoingActivityStatus status) =>
      _channel.invokeMethod('update', jsonMapEncode(status.toJson()));

  /// Clear an ongoing activity
  static Future<void> stop() => _channel.invokeMethod('stop');
}
