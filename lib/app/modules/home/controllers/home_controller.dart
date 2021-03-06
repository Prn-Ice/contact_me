import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../routes/app_pages.dart';
import '../../../services/navigation_service.dart';
import '../../contact/data/user_args.dart';

class HomeController extends GetxController {
  HomeController({NavigationService navigationService})
      : _navigationService = navigationService ?? Get.find();

  final NavigationService _navigationService;

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  File userImage;

  UserArgs params;

  Future<void> handleGenerateApp() async {
    params = UserArgs(
      name: nameController.text,
      phone: phoneController.text,
      email: emailController.text,
      image: userImage,
    );

    await _navigationService.toNamed(Routes.CONTACT, arguments: params.toMap());
  }

  /// File picker
  void saveImage(value) {
    Logger().i('saveImage $value');
    if (!value.isEmpty) {
      userImage = value[0];
    }
  }
}
