import 'dart:io';

import 'package:contact_me/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:matcher/matcher.dart';

void main() {
  group('HomeControllerTest -', () {
    final bindings = BindingsBuilder(() {
      Get.lazyPut<HomeController>(() => HomeController());
    });

    group('onInit -', () {
      test('before call, controller should not be in memory', () {
        // arrange
        Get.reset();
        // assert
        expect(
          () => Get.find<HomeController>(),
          throwsA(TypeMatcher<String>()),
        );
      });

      test('when called, controller should be in memory', () {
        // arrange
        bindings.builder();
        // act
        final controller = Get.find<HomeController>();
        // assert
        expect(controller.initialized, isTrue);
      });
    });

    group('handleGenerateApp -', () {
      test(
          'when called, should collect text from text fields '
          'and pass to next page', () {
        // arrange
        bindings.builder();
        final controller = Get.find<HomeController>();
        controller.nameController.text = 'test name';
        controller.phoneController.text = 'test phone';
        controller.emailController.text = 'test email';
        // act
        controller.handleGenerateApp();
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
      });
    });

    group('saveImage -', () {
      test('when called, should set the value of userImage', () {
        // arrange
        final file = File('');
        final testFiles = [file];
        bindings.builder();
        final controller = Get.find<HomeController>();
        // act
        controller.saveImage(testFiles);
        // assert
        expect(controller.userImage, equals(file));
      });
    });
  });
}
