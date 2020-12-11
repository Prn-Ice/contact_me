import 'dart:io';

import '../../../../data/api_resposne.dart';
import '../../../../network_exception.dart';
import '../../../../services/http_service.dart';
import '../user_args.dart';
import 'contact_repository.dart';

///
class ContactRepositoryImpl implements ContactRepository {
  ContactRepositoryImpl(HttpService httpService) : _httpService = httpService;
  final HttpService _httpService;

  @override
  Future<File> getLastApp(arch) {
    // TODO: implement getLastApp
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> getNewApp(UserArgs userArgs) async {
    final response = await _httpService.post(userArgs);
    if (response != null) {
      return response;
    }
    throw NetworkException();
  }
}
