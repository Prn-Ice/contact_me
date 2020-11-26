import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class UserArgs extends Equatable {
  final String name;
  final String phone;
  final String email;
  final File image;

  UserArgs({
    @required this.name,
    @required this.phone,
    @required this.email,
    @required this.image,
  });

  factory UserArgs.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UserArgs(
      name: map['name'],
      phone: map['phone'],
      email: map['email'],
      image: File(map['image']),
    );
  }

  @override
  List<Object> get props => [name, phone, email, image.path];

  @override
  bool get stringify => true;

  Map<String, String> toMap() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'image': image.path,
    };
  }
}
