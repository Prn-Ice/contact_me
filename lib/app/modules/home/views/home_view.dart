import 'package:contact_me/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<FormBuilderState> fbKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) {
        return Scaffold(
          body: SafeArea(
            child: <Widget>[
              30.heightBox,
              'Welcome to'.text.xl5.bold.make(),
              'Contact Me'.text.color(Vx.green500).xl5.bold.make(),
              15.heightBox,
              'We make sure you\'re never forgotten.'.text.make(),
              40.heightBox,
              Expanded(
                child: FormBuilder(
                  key: fbKey,
                  child: <Widget>[
                    FormBuilderTextField(
                      attribute: 'Name',
                      controller: _.nameController,
                      decoration: InputDecoration(labelText: 'Name'),
                      validators: [FormBuilderValidators.required()],
                    ),
                    20.heightBox,
                    FormBuilderPhoneField(
                      attribute: 'Phone',
                      controller: _.phoneController,
                      decoration: InputDecoration(labelText: 'Phone Number'),
                      validators: [
                        FormBuilderValidators.required(),
                        FormBuilderValidators.numeric(),
                      ],
                      defaultSelectedCountryIsoCode: 'NG',
                    ),
                    20.heightBox,
                    FormBuilderTextField(
                      attribute: 'Email',
                      controller: _.emailController,
                      decoration: InputDecoration(labelText: 'Email'),
                      validators: [
                        FormBuilderValidators.required(),
                        FormBuilderValidators.email(),
                      ],
                    ),
                  ]
                      .vStack(crossAlignment: CrossAxisAlignment.start)
                      .scrollVertical(padding: Vx.m12),
                ),
              ),
              FlatButton(
                child: 'Generate App'.text.xl.make(),
                onPressed: () {
                  if (!fbKey.currentState.validate()) return;
                  _.handleGenerateApp();
                },
                color: Vx.green500,
              ).box.makeCentered(),
              40.heightBox,
            ].vStack(crossAlignment: CrossAxisAlignment.start).p12(),
          ),
        );
      },
    );
  }
}
