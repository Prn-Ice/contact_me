import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/download_controller.dart';

class DownloadView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<DownloadController>(
        init: DownloadController(),
        builder: (_) => SafeArea(
          child: <Widget>[
            30.heightBox,
            'Congratulations'.text.xl5.bold.make(),
            'Your App is Ready'.text.color(Vx.green500).xl5.bold.make(),
            15.heightBox,
            'Select an architecture below and click download.'.text.make(),
            40.heightBox,
            Expanded(
              child: FormBuilder(
                key: _.fbKey,
                child: <Widget>[
                  FormBuilderDropdown(
                    name: 'Arch',
                    items: _.archs
                        .map(
                          (val) => DropdownMenuItem(
                              child: val.text.make(), value: val),
                        )
                        .toList(),
                    onChanged: (val) {
                      _.selectedArch(val as String);
                    },
                    decoration: InputDecoration(
                      labelText: 'Select an architecture',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                    validator: FormBuilderValidators.required(context),
                  ),
                ]
                    .vStack(crossAlignment: CrossAxisAlignment.start)
                    .scrollVertical(padding: Vx.m12),
              ),
            ),
            20.heightBox,
            FlatButton(
              child: 'Download'.text.xl.make(),
              padding: Vx.m12,
              onPressed: _.handleDownloadApp,
              color: Vx.green500,
            ).box.makeCentered(),
            40.heightBox,
          ].vStack(crossAlignment: CrossAxisAlignment.start).p12(),
        ),
      ),
    );
  }
}
