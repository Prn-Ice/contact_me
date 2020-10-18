import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

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
  }

  /// On button pressed collect text from text fields,
  /// pass as arguments to next page.
}
