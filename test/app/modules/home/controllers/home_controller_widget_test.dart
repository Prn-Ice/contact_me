import 'dart:io';

import 'package:contact_me/app/modules/home/controllers/home_controller.dart';
import 'package:contact_me/app/routes/app_pages.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get_test/get_test.dart';

void main() {
  group('HomeControllerWidgetTest -', () {
    final bindings = BindingsBuilder(() {
      Get.lazyPut<HomeController>(() => HomeController());
    });

    getTest(
      'when called, should collect text from text fields '
      'and pass to next page',
      getPages: AppPages.routes,
      initialRoute: AppPages.INITIAL,
      widgetTest: (tester) async {
        // arrange
        bindings.builder();
        final controller = Get.find<HomeController>();
        controller.nameController.text = 'test name';
        controller.phoneController.text = 'test phone';
        controller.emailController.text = 'test email';
        controller.userImage = File('');
        expect(Routes.HOME, Get.currentRoute);
        // act
        // controller.handleGenerateApp();
        // assert
        expect(
          controller.params,
          equals(
            {
              'name': controller.nameController.text,
              'phone': controller.phoneController.text,
              'email': controller.emailController.text,
              'image': controller.userImage,
            },
          ),
        );
        // expect(Routes.CONTACT, Get.currentRoute);
        // Get.back();
      },
    );
  });
}
