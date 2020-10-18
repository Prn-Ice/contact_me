import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
}
