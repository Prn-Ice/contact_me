import 'dart:io';

import 'package:contact_me/app/modules/home/controllers/home_controller.dart';
import 'package:contact_me/app/routes/app_pages.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:matcher/matcher.dart';
import 'package:mockito/mockito.dart';

import '../../../../mocks/navigation_service_mock.dart';

void main() {
  group('HomeControllerTest -', () {
    BindingsBuilder bindings;
    NavigationServiceMock navigationService;
    HomeController homeController;

    setUpAll(() {
      navigationService = NavigationServiceMock();
      bindings = BindingsBuilder(() {
        Get.lazyPut<HomeController>(
            () => HomeController(navigationService: navigationService));
      });
      bindings.builder();
      homeController = Get.find();
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
        /* // arrange
        bindings.builder();
        // act
        final controller = Get.find<HomeController>(); */
        // assert
        expect(homeController.initialized, isTrue);
      });
    });

    group('handleGenerateApp -', () {
      test(
          'when called, should collect text from text fields '
          'and pass to next page', () async {
        // arrange
        homeController.nameController.text = 'test name';
        homeController.phoneController.text = 'test phone';
        homeController.emailController.text = 'test email';
        homeController.userImage = File('');
        // act
        await homeController.handleGenerateApp();
        // assert
        expect(
          homeController.params.toMap(),
          equals(
            {
              'name': homeController.nameController.text,
              'phone': homeController.phoneController.text,
              'email': homeController.emailController.text,
              'image': homeController.userImage.path,
            },
          ),
        );
        verify(navigationService.toNamed(
          Routes.CONTACT,
          arguments: homeController.params.toMap(),
        )).called(1);
      });
    });

    group('saveImage -', () {
      test('when called, should set the value of userImage', () {
        // arrange
        final file = File('');
        final testFiles = [file];
        // act
        homeController.saveImage(testFiles);
        // assert
        expect(homeController.userImage, equals(file));
      });
    });
  });
}
