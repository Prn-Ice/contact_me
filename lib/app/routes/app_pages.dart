import 'package:contact_me/app/modules/download/views/download_view.dart';
import 'package:contact_me/app/modules/download/bindings/download_binding.dart';
import 'package:get/get.dart';

import '../modules/contact/bindings/contact_binding.dart';
import '../modules/contact/views/contact_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.CONTACT,
      page: () => ContactView(),
      binding: ContactBinding(),
    ),
    GetPage(
      name: Routes.DOWNLOAD, 
      page:()=> DownloadView(), 
      binding: DownloadBinding(),
    ),
  ];
}