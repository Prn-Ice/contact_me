import 'package:get/state_manager.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';

///
class PermissionService extends GetxService {
  Future<void> getPermission() async {
    Logger().d("Get Storage Permission");
    if (await Permission.storage.request().isGranted) {
      // Either the permission was already granted before or the user just granted it.
    }
  }
}
