import 'package:get/get.dart';
import 'package:contact_me/app/modules/download/controllers/download_controller.dart';

class DownloadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DownloadController>(
      () => DownloadController(),
    );
  }
}
