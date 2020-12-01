import 'package:flutter/material.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/contact_controller.dart';
import '../data/user_args.dart';

class ContactView extends GetView<ContactController> {
  UserArgs get getargs => controller.userArgs.value;
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
                backgroundImage: FileImage(getargs.image),
              ),
              20.heightBox,
              '${getargs.name}'.text.bold.xl3.makeCentered(),
              20.heightBox,
            ].vStack(
              crossAlignment: CrossAxisAlignment.stretch,
            ),
          ).box.make(),
          Expanded(
            child: Container(
              child: <Widget>[
                40.heightBox,
                buildContactCard(getargs.phone, Icons.phone),
                40.heightBox,
                buildContactCard(getargs.email, Icons.mail),
                40.heightBox,
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
      floatingActionButton: <Widget>[
        FloatingActionButton.extended(
          onPressed: Get.back,
          label: 'Back'.text.make(),
          backgroundColor: Vx.red400,
          heroTag: 'button 1',
        ),
        20.widthBox,
        FloatingActionButton.extended(
          onPressed: controller.handleActuallyCreateApp,
          label: 'Continue'.text.make(),
          backgroundColor: Vx.green400,
        )
      ].hStack(),
    );
  }

  Widget buildContactCard(String text, IconData icon) {
    return [
      Icon(icon, color: Vx.green500, size: 30),
      40.widthBox,
      '$text'.text.xl.black.make(),
    ].hStack().px24();
  }
}
