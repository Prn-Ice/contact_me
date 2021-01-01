import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:get/state_manager.dart';

///
class HudService extends GetxService {
  HudService init() {
    _updateHUDConfig();
    return this;
  }

  void _updateHUDConfig() {
    SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.dark);
    SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.gradient);
    SVProgressHUD.setDefaultAnimationType(SVProgressHUDAnimationType.flat);
    // SVProgressHUD.setHapticsEnabled(_hapticsEnabled);
  }

  void show({String status}) {
    SVProgressHUD.show(status: status);
  }

  void showSuccess({String status}) {
    SVProgressHUD.showSuccess(status: status);
  }

  void showProgress(num progress, {String status}) {
    SVProgressHUD.showProgress(progress, status: status);
  }

  void showError({String status}) {
    SVProgressHUD.showError(status: status);
  }

  void dismiss() {
    SVProgressHUD.dismiss();
  }
}
