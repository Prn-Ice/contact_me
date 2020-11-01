import 'dart:io';

import 'package:contact_me/app/modules/contact/controllers/contact_controller.dart';
import 'package:contact_me/app/modules/contact/data/user_args.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:matcher/matcher.dart';

void main() {
  group('ContactControllerTest -', () {
    group('onInit -', () {
      setUp(() {
        BindingsBuilder bindingsBuilder = BindingsBuilder(() {
          Get.lazyPut<ContactController>(() => ContactController());
        });
        bindingsBuilder.builder();
      });
      tearDown(Get.reset);
      test('before call, controller should not be in memory', () {
        // arrange
        Get.reset();
        // assert
        expect(
          () => Get.find<ContactController>(),
          throwsA(
            TypeMatcher<String>(),
          ),
        );
      });

      test(
        'when called, controller should be in memory',
        () async {
          // arrange
          final controller = Get.find<ContactController>();
          // assert
          expect(controller.initialized, isTrue);
        },
      );

      /// TODO: Need to be able to test get arguments
      test(
        'when called, should set the value of fields from Get.arguments',
        () async {
          // arrange
          final controller = Get.find<ContactController>();
          // act
          controller.userArgs.value = UserArgs.fromMap({
            'name': 'prince',
            'phone': '123',
            'email': 'p@p.com',
            'image': File(''),
          });
          // assert
          expect(controller.name.value, equals('name'));
          expect(controller.phone.value, equals('123'));
          expect(controller.email.value, equals('p@p.com'));
          expect(controller.image.value, equals(File('')));
        },
      );
    });
  });
}
