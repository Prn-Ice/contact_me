import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../routes/app_pages.dart';
import '../../contact/data/user_args.dart';

class HomeController extends GetxController {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  File userImage;

  UserArgs params;

  void handleGenerateApp() {
    params = UserArgs(
      name: nameController.text,
      phone: phoneController.text,
      email: emailController.text,
      image: userImage,
    );

    Get.toNamed(Routes.CONTACT, arguments: params.toMap());
  }

  /// File picker
  void saveImage(value) {
    Logger().i('saveImage $value');
    if (!value.isEmpty) {
      userImage = value[0];
    }
  }
}
