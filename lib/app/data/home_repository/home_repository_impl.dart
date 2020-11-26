import 'dart:io';

import '../../modules/contact/data/user_args.dart';
import '../../services/http_service.dart';
import 'home_repository.dart';

///
class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl(HttpService httpService) : _httpService = httpService;
  final HttpService _httpService;

  @override
  Future<File> getLastApp(arch) {
    // TODO: implement getLastApp
    throw UnimplementedError();
  }

  @override
  Future<File> getNewApp(UserArgs userArgs) async {
    final file = await _httpService.post(userArgs);
    return file;
  }
}
