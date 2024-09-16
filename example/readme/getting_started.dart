import 'package:permission_handler/permission_handler.dart';

void main() {
  [Permission.notification, Permission.sensors].request();
}
