import 'dart:io';
import 'package:contact_me/app/modules/contact/data/user_args.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:let_log/let_log.dart';

import '../../../routes/app_pages.dart';

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
    Logger.log('saveImage $value');
    if (!value.isEmpty) {
      userImage = value[0];
    }
  }
}
