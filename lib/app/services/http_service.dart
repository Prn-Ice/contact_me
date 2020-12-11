import 'package:contact_me/app/data/api_resposne.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';

import '../modules/contact/data/user_args.dart';

class HttpService {
  Future<ApiResponse> post(UserArgs userArgs) async {
    final baseUrl = 'http://10.0.2.2:8888/';
    final queryParameters = {
      "name": userArgs?.name,
      "email": userArgs?.email,
      "phone": userArgs?.phone
    };
    Logger().i("post: $baseUrl/create,  query: $queryParameters");

    // Response data.
    // NOTE: In the future try returnin exact [ApiResponse] class from Server.
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
        .then(
      (data) {
        return data;
      },
      onError: (err) {
        Logger().e('Create app request failed', err);
      },
    );

    // Return a response.
    if (response.statusCode != 200) {
      Logger().e("post: $baseUrl/create, status: ${response.statusCode}");
      return null;
    } else {
      Logger().d(
          "post: $baseUrl/create, status: ${response.statusCode}, data: ${response.data}");
      return ApiResponse.fromJson(response.data);
    }
  }
}
