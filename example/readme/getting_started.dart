import 'package:permission_handler/permission_handler.dart';

void main() async {
  await Permission.notification.request();
}
