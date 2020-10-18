import 'package:contact_me/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:matcher/matcher.dart';

void main() {
  group('HomeControllerTest -', () {
    group('onInit -', () {
      test('before call, controller should not be in memory', () {
        expect(
          () => Get.find<HomeController>(),
          throwsA(TypeMatcher<String>()),
        );
      });

      test('when called, controller should be in memory', () {
        // arrange
        final bindings = BindingsBuilder(() {
          Get.lazyPut<HomeController>(() => HomeController());
        });
        // act
        bindings.builder();
        final controller = Get.find<HomeController>();
        // assert
        expect(controller.initialized, isTrue);
      });
    });
  });
}
