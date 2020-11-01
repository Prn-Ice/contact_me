import 'dart:io';

import 'package:get/get.dart';

import '../data/user_args.dart';

class ContactController extends GetxController {
  // Get the data from the previous screen
  // Expose it to this screen using variables

  final Rx<UserArgs> userArgs = Rx<UserArgs>(UserArgs.fromMap(Get.arguments));

  final RxString name = RxString();
  final RxString phone = RxString();
  final RxString email = RxString();
  final Rx<File> image = Rx<File>();

  @override
  void onInit() {
    super.onInit();
    name.value = userArgs?.value?.name;
    phone.value = userArgs?.value?.phone;
    email.value = userArgs?.value?.email;
    image.value = userArgs?.value?.image;
  }
}
