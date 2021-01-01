import 'package:contact_me/app/data/api_resposne.dart';
import 'package:contact_me/app/services/http_service.dart';
import 'package:contact_me/app/services/hud_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class DownloadController extends GetxController {
  final HttpService _httpService = Get.find();
  final HudService _hudService = Get.find();

  final fbKey = GlobalKey<FormBuilderState>();

  final RxList<String> archs = <String>[].obs;

  final RxString selectedArch = ''.obs;

  Future<void> handleDownloadApp() async {
    if (!fbKey.currentState.validate()) return;
    // Download Logic Here
    _hudService.show(status: 'Downloading ${selectedArch.value}');
    await _httpService.download(selectedArch.value, _showDownloadProgress).then(
      (data) {
        _hudService.showSuccess(
            status: '${selectedArch.value} downloaded successfully.\n'
                'Check Downloads folder.');
      },
      onError: (err) {
        Logger().e(err.toString());
        _hudService.showError(status: 'Failed with Error');
      },
    );
  }

  void _showDownloadProgress(int received, int total) {
    // print('$received, $total \n');
    if (total != -1) {
      _hudService.showProgress(
        (received / total * 100),
        status: 'Downloading ${selectedArch.value}',
      );
    }
  }

  @override
  void onInit() {
    // Get ApiResponse from previous screen
    final ApiResponse response = Get.arguments;
    // Update list of architectures from [response]
    archs.addAll(response.data);
    // Set [selectedArch]
    selectedArch(archs[0]);
    super.onInit();
  }
}
