import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'wear_ongoing_activity_method_channel.dart';

abstract class WearOngoingActivityPlatform extends PlatformInterface {
  /// Constructs a WearOngoingActivityPlatform.
  WearOngoingActivityPlatform() : super(token: _token);

  static final Object _token = Object();

  static WearOngoingActivityPlatform _instance = MethodChannelWearOngoingActivity();

  /// The default instance of [WearOngoingActivityPlatform] to use.
  ///
  /// Defaults to [MethodChannelWearOngoingActivity].
  static WearOngoingActivityPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [WearOngoingActivityPlatform] when
  /// they register themselves.
  static set instance(WearOngoingActivityPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
