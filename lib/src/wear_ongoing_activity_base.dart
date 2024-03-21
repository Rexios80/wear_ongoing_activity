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
  /// - [foregroundServiceTypes]: The types of activities this app performs as a foreground service
  /// - [smallIcon]: The name of the small icon resource for the notification
  /// - [staticIcon]: The name of the icon resource to show on the deactivated watch face
  /// - [animatedIcon]: The name of the icon resource to show on the activated watch face
  /// - [status]: The status of the ongoing activity
  ///
  /// [smallIcon], [staticIcon], and [animatedIcon] must exist in
  /// `android/app/src/main/res/drawable`.
  static Future<void> start({
    required String channelId,
    required String channelName,
    required int notificationId,
    required NotificationCategory category,
    Set<ForegroundServiceType> foregroundServiceTypes = const {
      ForegroundServiceType.manifest,
    },
    required String smallIcon,
    required String staticIcon,
    String? animatedIcon,
    required OngoingActivityStatus status,
  }) =>
      _channel.invokeMethod('start', {
        'channelId': channelId,
        'channelName': channelName,
        'notificationId': notificationId,
        'category': category.value,
        'foregroundServiceType':
            foregroundServiceTypes.fold(0, (v, e) => v | e.value),
        'smallIcon': smallIcon,
        'staticIcon': staticIcon,
        'animatedIcon': animatedIcon,
        ...jsonMapEncode(status.toJson()),
      });

  /// Check if an ongoing activity is running
  static Future<bool> isOngoing() async =>
      await _channel.invokeMethod<bool>('isOngoing') ?? false;

  /// Update an ongoing activity with a new status
  ///
  /// Attempting to update an ongoing activity that is not running will throw
  /// an error. Use [isOngoing] to check if the activity is running before
  /// calling this method. The first start of an ongoing activity may take a
  /// while, so do not assume it is running immediately after calling [start].
  static Future<void> update(OngoingActivityStatus status) =>
      _channel.invokeMethod('update', jsonMapEncode(status.toJson()));

  /// Clear an ongoing activity
  static Future<void> stop() => _channel.invokeMethod('stop');
}
