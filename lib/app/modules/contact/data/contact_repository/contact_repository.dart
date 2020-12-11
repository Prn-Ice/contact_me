import 'dart:io';

import 'package:contact_me/app/data/api_resposne.dart';

import '../user_args.dart';

abstract class ContactRepository {
  /// Send a http post request to the server.
  /// Receive an apk as a response after some time.
  Future<ApiResponse> getNewApp(UserArgs userArgs);

  /// Return the last app built from the API.
  Future<File> getLastApp(var arch);
}
