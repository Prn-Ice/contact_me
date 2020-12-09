import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../data/contact_repository/contact_repository.dart';
import '../data/user_args.dart';

class ContactController extends GetxController with StateMixin {
  ContactController(ContactRepository contactRepository)
      : _contactRepository = contactRepository;
  final ContactRepository _contactRepository;

  // Get the data from the previous screen
  // Expose it to this screen using variables
  final Rx<UserArgs> userArgs = Rx<UserArgs>(UserArgs.fromMap(Get.arguments));

  /// Send request to server to buld app.
  /// While request is processing set status to loading.
  Future<void> handleActuallyCreateApp() async {
    // show loading on start, data on success
    // and error message on error with 0 boilerplate
    SVProgressHUD.show(status: 'Fetching Your app');
    change(null, status: RxStatus.loading());
    final app = await _contactRepository.getNewApp(userArgs.value)?.then((data) {
      change(data, status: RxStatus.success());
      SVProgressHUD.showSuccess(status: 'Great Success!');
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
      Logger().e(err.toString());
      SVProgressHUD.showError(status: 'Failed with Error');
    });
  }

  @override
  void onInit() {
    change(null, status: RxStatus.success());
    super.onInit();
  }
}
