import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  File userImage;

  Map<String, dynamic> params = {};

  void handleGenerateApp() {
    params = {
      'name': nameController.text,
      'phone': phoneController.text,
      'email': emailController.text,
      'image': userImage,
    };

    Get.toNamed(Routes.CONTACT, arguments: params);
  }

  /// File picker
  void saveImage(value) {
    log('saveImage $value');
    if (!value.isEmpty) {
      userImage = value[0];
    }
  }
}
