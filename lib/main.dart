import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';

import 'app/routes/app_pages.dart';
import 'app/services/hud_service.dart';
import 'app/services/navigation_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  /// AWAIT SERVICES INITIALIZATION
  initServices();
  runApp(MyApp());
}

void initServices() {
  Logger().d('starting services ...');

  /// Here is where you put get_storage, hive, shared_pref initialization.
  /// or moor connection, or whatever that's async.
  Get.put(() => HudService().init());
  Get.put(NavigationService());
  Logger().v('All services started...');
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Contact-Me",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData.dark().copyWith(
        textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
      ),
    );
  }
}
