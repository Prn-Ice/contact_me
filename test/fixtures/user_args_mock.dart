import 'dart:io';

import 'package:contact_me/app/modules/contact/data/user_args.dart';

final mockUserArgs = UserArgs(
  name: 'Prince Nna',
  phone: '08083842346',
  email: 'prince@gmail.com',
  image: File(''),
);

final mockUserArgsMap = {
  'name': 'Prince Nna',
  'phone': '08083842346',
  'email': 'prince@gmail.com',
  'image': File('').path,
};
