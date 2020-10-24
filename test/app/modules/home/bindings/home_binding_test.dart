import 'package:contact_me/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
 group('HomeBindingTest -', (){

    final binding = BindingsBuilder(() {
      Get.lazyPut<HomeController>(() => HomeController());
    });

    test('Test Binding', () {
      expect(Get.isPrepared<HomeController>(), false);
      binding.builder();
      expect(Get.isPrepared<HomeController>(), true);
      Get.reset();
    });
 });
}