import 'package:contact_me/app/modules/contact/controllers/contact_controller.dart';
import 'package:contact_me/app/modules/contact/data/contact_repository/contact_repository.dart';
import 'package:contact_me/app/modules/contact/data/contact_repository/contact_repository_impl.dart';
import 'package:contact_me/app/services/http_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  group('ContactBindingTest -', () {
    HttpService httpService;
    ContactRepository contactRepository;
    BindingsBuilder binding;

    setUp(() {
      httpService = HttpService();
      contactRepository = ContactRepositoryImpl(httpService);
      binding = BindingsBuilder(() {
        Get.lazyPut<ContactController>(
            () => ContactController(contactRepository));
      });
    });

    test('Test Binding', () {
      expect(Get.isPrepared<ContactController>(), false);
      binding.builder();
      expect(Get.isPrepared<ContactController>(), true);
      Get.reset();
    });
  });
}
