import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../data/api_resposne.dart';
import '../../../routes/app_pages.dart';
import '../../../services/hud_service.dart';
import '../../../services/navigation_service.dart';
import '../data/contact_repository/contact_repository.dart';
import '../data/user_args.dart';

class ContactController extends GetxController with StateMixin {
  ContactController(ContactRepository contactRepository)
      : _contactRepository = contactRepository;
  final ContactRepository _contactRepository;
  final HudService _hudService = Get.find();
  final NavigationService _navigationService = Get.find();

  // Get the data from the previous screen
  // Expose it to this screen using variables
  final Rx<UserArgs> userArgs = Rx<UserArgs>(UserArgs.fromMap(Get.arguments));

  /// Send request to server to buld app.
  /// While request is processing set status to loading.
  ///
  /// Show loading on start, data on success and error message on error.
  Future<void> handleActuallyCreateApp() async {
    // Display loading dialog.
    _hudService.show(status: 'Fetching Your app');
    // Change controller status to loading
    change(null, status: RxStatus.loading());
    // Send request for application build using [ContactRe]
    final response =
        await _contactRepository.getNewApp(userArgs.value).then<ApiResponse>(
      (data) {
        // We have a valid response, set data to response and show success dialog.
        change(data, status: RxStatus.success());
        _hudService.showSuccess(status: 'Great, Success!');
        _navigationService.toNamed(Routes.DOWNLOAD, arguments: data);
        return data;
      },
      onError: (err) {
        // We have an error, set data to [null] and show error dialog.
        change(null, status: RxStatus.error(err.toString()));
        Logger().e(err.toString());
        _hudService.showError(status: 'Failed with Error');
      },
    );
  }

  @override
  void onInit() {
    change(null, status: RxStatus.success());
    super.onInit();
  }
}
