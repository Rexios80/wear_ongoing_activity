
import 'wear_ongoing_activity_platform_interface.dart';

class WearOngoingActivity {
  Future<String?> getPlatformVersion() {
    return WearOngoingActivityPlatform.instance.getPlatformVersion();
  }
}
