import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:contact_me/app/modules/contact/controllers/contact_controller.dart';

class ContactView extends GetView<ContactController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ContactView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ContactView is working', 
          style: TextStyle(fontSize:20),
        ),
      ),
    );
  }
}
  