import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:contact_me/app/modules/home/controllers/home_controller.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:dart_code_viewer/dart_code_viewer.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Mustache Test'.text.make(),
      ),
      body: Center(
        child: Column(
          children: [
            20.heightBox,
            DartCodeViewer(
              controller.generateCode(),
              backgroundColor: Vx.white,
              showCopyButton: false,
            ).box.height(400).make(),
            20.heightBox,
            'Push Me'.text.make().click(controller.handleClick).make(),
          ],
        ),
      ),
    );
  }
}
