import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/home_controller.dart';

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
                      name: 'Name',
                      controller: _.nameController,
                      decoration: InputDecoration(labelText: 'Name'),
                      validator: FormBuilderValidators.required(context),
                    ),
                    20.heightBox,
                    FormBuilderPhoneField(
                      name: 'Phone',
                      controller: _.phoneController,
                      decoration: InputDecoration(labelText: 'Phone Number'),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                        FormBuilderValidators.numeric(context),
                      ]),
                      defaultSelectedCountryIsoCode: 'NG',
                    ),
                    20.heightBox,
                    FormBuilderTextField(
                      name: 'Email',
                      controller: _.emailController,
                      decoration: InputDecoration(labelText: 'Email'),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                        FormBuilderValidators.email(context),
                      ]),
                    ),
                    20.heightBox,
                    FormBuilderImagePicker(
                      name: 'Image',
                      decoration: InputDecoration(labelText: 'Image'),
                      validator: FormBuilderValidators.required(context),
                      cameraIcon: Icon(Icons.camera, color: Vx.green500),
                      galleryIcon: Icon(Icons.image, color: Vx.green500),
                      maxImages: 1,
                      onChanged: (value) {
                        _.saveImage(value);
                      },
                    ),
                  ]
                      .vStack(crossAlignment: CrossAxisAlignment.start)
                      .scrollVertical(padding: Vx.m12),
                ),
              ),
              20.heightBox,
              FlatButton(
                child: 'Generate App'.text.xl.make(),
                padding: Vx.m12,
                onPressed: () {
                  if (!fbKey.currentState.validate()) return;
                  _.handleGenerateApp();
                },
                color: Vx.green500,
              ).box.makeCentered(),
            ].vStack(crossAlignment: CrossAxisAlignment.start).p12(),
          ),
        );
      },
    );
  }
}
