import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:permission_handler/permission_handler.dart';

class Perms {
  static final message  = FirebaseMessaging.instance;
 static Future<void> notification()
async {
  
await message.requestPermission(
  alert: true,
  announcement: true
);
final fCMToken = await message.getToken();
print('Token : $fCMToken');



}

    static Future<void> storage()
async {
  await Permission.camera.isDenied.then((value) {
        if (value) {
          Permission.camera.request();
        }
      });
}
static Future<void> location()
async {
  await Permission.location.isDenied.then((value) {
        if (value) {
          Permission.location.request();
        }
      });
}
}