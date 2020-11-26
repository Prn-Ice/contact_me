import 'package:contact_me/app/data/home_repository/home_repository.dart';
import 'package:contact_me/app/data/home_repository/home_repository_impl.dart';
import 'package:contact_me/app/services/http_service.dart';
import 'package:get/get.dart';
import 'package:let_log/let_log.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Logger.config.setPrintNames(
      log: "[😄Log]",
      debug: "[🐛Debug]",
      warn: "[❗Warn]",
      error: "[❌Error]",
      request: "[⬆️Req]",
      response: "[⬇️Res]",
    );
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
  }
}
