import 'dart:io';

import 'package:contact_me/app/modules/contact/data/user_args.dart';
import 'package:dio/dio.dart';
import 'package:let_log/let_log.dart';
import 'package:path/path.dart';

class HttpService {
  Future<File> post(UserArgs userArgs) async {
    final baseUrl = 'http://127.0.0.1:8889/';
    final queryParameters = {
      "name": userArgs?.name,
      "email": userArgs?.email,
      "phone": userArgs?.phone
    };
    Logger.net("post: $baseUrl/create", data: queryParameters);

    // Response, hopefully apk.
    Response response;
    // Base Url, headers, etc
    BaseOptions baseOptions = BaseOptions(baseUrl: baseUrl);
    // Prep the user image for transport.
    var filePath = userArgs?.image?.path;
    FormData formData = new FormData.fromMap({
      "image":
          await MultipartFile.fromFile(filePath, filename: basename(filePath)),
    });
    Dio dio = Dio(baseOptions);
    // Send post request.
    response = await dio.post(
      "/create",
      data: formData,
      queryParameters: queryParameters,
    );
    // Return a response.
    if (response.statusCode != 200) {
      Logger.endNet("post: $baseUrl/create", status: response.statusCode);
      return null;
    } else {
      Logger.endNet(
        "post: $baseUrl/create",
        status: response.statusCode,
        data: response.data,
      );
      return response.data;
    }
  }
}
