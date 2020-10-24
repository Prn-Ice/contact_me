import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  Map<String, String> params = {};

  void handleGenerateApp() {
    params = {
      'name': nameController.text,
      'phone': phoneController.text,
      'email': emailController.text,
    };

    Get.toNamed(Routes.CONTACT, arguments: params);
  }

  /// File picker
  void saveImage(value) {
    print(value);
  }
}
