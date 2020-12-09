import 'package:get/get.dart';

import '../../../services/http_service.dart';
import '../controllers/contact_controller.dart';
import '../data/contact_repository/contact_repository.dart';
import '../data/contact_repository/contact_repository_impl.dart';

class ContactBinding extends Bindings {
  @override
  void dependencies() {
    final HttpService httpService = HttpService();
    final ContactRepository homeRepository = ContactRepositoryImpl(httpService);
    Get.lazyPut<ContactController>(() => ContactController(homeRepository));
  }

  
}
