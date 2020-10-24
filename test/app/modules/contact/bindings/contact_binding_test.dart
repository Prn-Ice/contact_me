import 'package:contact_me/app/modules/contact/controllers/contact_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  group('ContactBindingTest -', () {
    final binding = BindingsBuilder(() {
      Get.lazyPut<ContactController>(() => ContactController());
    });

    test('Test Binding', () {
      expect(Get.isPrepared<ContactController>(), false);
      binding.builder();
      expect(Get.isPrepared<ContactController>(), true);
      Get.reset();
    });
  });
}
