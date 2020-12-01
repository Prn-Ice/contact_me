import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:get/get.dart';

import '../../../data/home_repository/home_repository.dart';
import '../../../data/home_repository/home_repository_impl.dart';
import '../../../services/http_service.dart';
import '../controllers/contact_controller.dart';

class ContactBinding extends Bindings {
  @override
  void dependencies() {
    final HttpService httpService = HttpService();
    final HomeRepository homeRepository = HomeRepositoryImpl(httpService);
    Get.lazyPut<ContactController>(() => ContactController(homeRepository));
    _updateHUDConfig();
  }

  void _updateHUDConfig() {
    SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.dark);
    SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.gradient);
    SVProgressHUD.setDefaultAnimationType(SVProgressHUDAnimationType.flat);
    // SVProgressHUD.setHapticsEnabled(_hapticsEnabled);
  }
}
