import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:contact_me/app/modules/download/controllers/download_controller.dart';

class DownloadView extends GetView<DownloadController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DownloadView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DownloadView is working', 
          style: TextStyle(fontSize:20),
        ),
      ),
    );
  }
}
  