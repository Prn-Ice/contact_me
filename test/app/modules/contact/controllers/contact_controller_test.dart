import 'package:contact_me/app/modules/contact/controllers/contact_controller.dart';
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
    });
  });
}
