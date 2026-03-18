import 'package:permission_handler/permission_handler.dart';

class PermissionHelper {
  static Future<bool> requestPermission() async {
    bool isGranted = false;
    // var permissionCamera = Permission.camera;
    // if (await permissionCamera.status.isDenied) {
    //   await permissionCamera.request();
    // }
    // Map<Permission, PermissionStatus> statuses = await [
    //   Permission.camera,
    //   Permission.microphone,
    //   Permission.phone,
    //   Permission.audio,
    // ].request();

    if (await Permission.camera.status.isGranted) {
      isGranted = true;
    }

    if (await Permission.microphone.status.isGranted) {
      isGranted = true;
    }

    if (await Permission.phone.status.isGranted) {
      isGranted = true;
    }

    if (await Permission.audio.status.isGranted) {
      isGranted = true;
    }
    return isGranted;
  }
}
