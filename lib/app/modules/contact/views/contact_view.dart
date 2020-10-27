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
          Container()
              .box
              .height(300)
              .withDecoration(
                BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(16)),
                ),
              )
              .make(),
          Expanded(child: Container().box.white.make()),
        ].vStack(),
      ),
    );
  }
}
