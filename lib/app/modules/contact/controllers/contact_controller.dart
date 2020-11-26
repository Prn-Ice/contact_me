import 'package:contact_me/app/data/home_repository/home_repository.dart';
import 'package:get/get.dart';

import '../data/user_args.dart';

class ContactController extends GetxController {
  ContactController(HomeRepository homeRepository)
      : _homeRepository = homeRepository;
  final HomeRepository _homeRepository;

  RxStatus status = RxStatus.loading();

  // Get the data from the previous screen
  // Expose it to this screen using variables
  final Rx<UserArgs> userArgs = Rx<UserArgs>(UserArgs.fromMap(Get.arguments));

  /// Send request to server to buld app.
  /// While request is processing set status to loading.
  Future<void> handleActuallyCreateApp() async {
    await _homeRepository.getNewApp(userArgs.value);
  }

  @override
  void onInit() {
    status = RxStatus.success();
    super.onInit();
  }
}
