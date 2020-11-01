import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/contact_controller.dart';

class ContactView extends GetView<ContactController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: <Widget>[
          Container(
            child: <Widget>[
              40.heightBox,
              CircleAvatar(
                radius: 70,
                backgroundImage: FileImage(controller.image.value),
              ),
              20.heightBox,
              '${controller.name}'.text.bold.xl3.makeCentered(),
              20.heightBox,
            ].vStack(
              crossAlignment: CrossAxisAlignment.stretch,
            ),
          ).box.make(),
          Expanded(
            child: Container(
              child: <Widget>[
                20.heightBox,
                [
                  Icon(Icons.phone, color: Vx.gray500, size: 30),
                  20.widthBox,
                  '${controller.phone}'.text.xl.black.make(),
                ].hStack(),
                30.heightBox,
                [
                  Icon(Icons.mail, color: Vx.gray500, size: 30),
                  20.widthBox,
                  '${controller.email}'.text.xl.black.make(),
                ].hStack(),
                30.heightBox,
              ].vStack(
                crossAlignment: CrossAxisAlignment.stretch,
                axisSize: MainAxisSize.max,
              ),
            )
                .box
                .p20
                .withDecoration(
                  BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                )
                .make(),
          ),
        ].vStack(),
      ),
    );
  }
}
