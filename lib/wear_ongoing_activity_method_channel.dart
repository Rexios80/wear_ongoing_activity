import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'wear_ongoing_activity_platform_interface.dart';

/// An implementation of [WearOngoingActivityPlatform] that uses method channels.
class MethodChannelWearOngoingActivity extends WearOngoingActivityPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('wear_ongoing_activity');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
