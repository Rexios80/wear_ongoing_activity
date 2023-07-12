import 'package:flutter/services.dart';
import 'package:wear_ongoing_activity/wear_ongoing_activity.dart';

/// Handle an ongoing activity on Wear OS.
class WearOngoingActivity {
  static const _channel = MethodChannel('wear_ongoing_activity');

  WearOngoingActivity._();

  static Future<void> start({
    required String notificationId,
    required String channelId,
    NotificationCategory? category,
    String? smallIcon,
    List<String> templates = const [],
    List<StatusPart> parts = const [],
  }) {

  }
}
