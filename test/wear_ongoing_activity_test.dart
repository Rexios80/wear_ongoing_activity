import 'package:flutter_test/flutter_test.dart';
import 'package:wear_ongoing_activity/wear_ongoing_activity.dart';
import 'package:wear_ongoing_activity/wear_ongoing_activity_platform_interface.dart';
import 'package:wear_ongoing_activity/wear_ongoing_activity_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockWearOngoingActivityPlatform
    with MockPlatformInterfaceMixin
    implements WearOngoingActivityPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final WearOngoingActivityPlatform initialPlatform = WearOngoingActivityPlatform.instance;

  test('$MethodChannelWearOngoingActivity is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelWearOngoingActivity>());
  });

  test('getPlatformVersion', () async {
    WearOngoingActivity wearOngoingActivityPlugin = WearOngoingActivity();
    MockWearOngoingActivityPlatform fakePlatform = MockWearOngoingActivityPlatform();
    WearOngoingActivityPlatform.instance = fakePlatform;

    expect(await wearOngoingActivityPlugin.getPlatformVersion(), '42');
  });
}
