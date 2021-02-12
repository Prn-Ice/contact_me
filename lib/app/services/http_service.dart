import 'dart:io';

import 'package:contact_me/app/data/api_resposne.dart';
import 'package:contact_me/app/services/permission_service.dart';
import 'package:dio/dio.dart';
import 'package:ext_storage/ext_storage.dart';

import 'package:get/instance_manager.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';

import '../modules/contact/data/user_args.dart';

class HttpService {
  // static const BASEURL = 'http://192.168.0.158:8888';
  static const BASEURL = 'https://intense-citadel-33734.herokuapp.com/';
  final PermissionService _permissionService = Get.find();

  Future<ApiResponse> post(UserArgs userArgs) async {
    final queryParameters = {
      "name": userArgs?.name,
      "email": userArgs?.email,
      "phone": userArgs?.phone
    };
    Logger().i("post: $BASEURL/create,  query: $queryParameters");

    // Response data.
    // NOTE: In the future try returning exact [ApiResponse] class from Server.
    Response response;
    // Base Url, headers, etc
    BaseOptions baseOptions = BaseOptions(
      baseUrl: BASEURL,
      headers: {'Content-Type': 'multipart/form-data'},
      // receiveTimeout: 120000,
      // sendTimeout: 120000,
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
      Logger().e("post: $BASEURL/create, status: ${response.statusCode}");
      return null;
    } else {
      Logger().d(
          "post: $BASEURL/create, status: ${response.statusCode}, data: ${response.data}");
      return ApiResponse.fromMap(response.data);
    }
  }

  Future download(
      String arch, void Function(int, int) onReceiveProgress) async {
    Logger().i("download: $BASEURL/files,  arch: $arch");

    // Response data.
    Response response;
    // Base Url, headers, etc
    BaseOptions baseOptions = BaseOptions(baseUrl: BASEURL);

    Dio dio = Dio(baseOptions);

    // Get File permissions
    await _permissionService.getPermission();

    // Create download file
    String path = await ExtStorage.getExternalStoragePublicDirectory(
        ExtStorage.DIRECTORY_DOWNLOADS);
    String fullPath = "$path/$arch";
    print(fullPath);
    File file = File(fullPath);

    // Download selected file
    response = await dio
        .get(
      "/files/$arch",
      onReceiveProgress: onReceiveProgress,
      options: Options(
        responseType: ResponseType.bytes,
        followRedirects: false,
        validateStatus: (status) {
          return status < 500;
        },
      ),
    )
        .then(
      (data) {
        return data;
      },
      onError: (err) {
        Logger().e('Download $arch request failed', err);
      },
    );

    // Return a response.
    if (response.statusCode != 200) {
      Logger().e(
          "download: $BASEURL/files,  arch: $arch, status: ${response.statusCode}");
      return null;
    } else {
      Logger().d(
        "download: $BASEURL/files,  arch: $arch, status: ${response.statusCode}, data: $response",
      );
      var raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();
    }
  }
}
