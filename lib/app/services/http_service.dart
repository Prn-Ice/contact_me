import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:path/path.dart';

import '../modules/contact/data/user_args.dart';

class HttpService {
  Future<http.Response> getApp(UserArgs userArgs) async {
    try {
      // Form Url
      var uri = Uri.parse(
          'http://10.21.0.123:8888/create?name=${userArgs?.name}&email=${userArgs?.email}&phone=${userArgs?.phone}');

      // Send request with image in body
      var request = http.MultipartRequest('POST', uri)
        ..files.add(
          await http.MultipartFile.fromPath('image', userArgs?.image?.path),
        );
      // Add custom headers
      request.headers.addAll({'Content-Type': 'multipart/form-data'});
      // Send response
      var response = await request.send();
      if (response.statusCode == 200) {
        Logger().i('Uploaded!');
        // Return a normal response
        var normalResponse = await http.Response.fromStream(response);
        return normalResponse;
      }
    } catch (e, stacktrace) {
      Logger().e('create app request failed', e, stacktrace);
      throw e;
    }
    return null;
  }

  Future<http.Response> post(UserArgs userArgs) async {
    final baseUrl = 'http://10.21.0.123:8888/';
    final queryParameters = {
      "name": userArgs?.name,
      "email": userArgs?.email,
      "phone": userArgs?.phone
    };
    Logger().i("post: $baseUrl/create,  query: $queryParameters");

    // Response, hopefully apk.
    Response response;
    // Base Url, headers, etc
    BaseOptions baseOptions = BaseOptions(
      baseUrl: baseUrl,
      headers: {'Content-Type': 'multipart/form-data'},
    );
    // Prep the user image for transport.
    var filePath = userArgs?.image?.path;
    FormData formData = new FormData.fromMap({
      "image": await MultipartFile.fromFile(
        filePath,
        filename: basename(filePath),
      ),
    });
    Dio dio = Dio(baseOptions);

    // Send post request.
    response = await dio
        .post(
      "/create",
      data: formData,
      queryParameters: queryParameters,
    )
        .then((data) {
      print('$data done');
      return data;
    }, onError: (err) {
      Logger().e('Create app request failed', err);
    });

    // Return a response.
    if (response.statusCode != 200) {
      Logger().i("post: $baseUrl/create, status: ${response.statusCode}");
      return null;
    } else {
      Logger().i(
          "post: $baseUrl/create, status: ${response.statusCode}, data: ${response.data}");
      return response.data;
    }
  }
}
