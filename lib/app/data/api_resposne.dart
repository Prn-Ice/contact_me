import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class ApiResponse extends Equatable {
  final bool success;
  final List<String> data;
  ApiResponse({
    @required this.success,
    @required this.data,
  });

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'data': data,
    };
  }

  factory ApiResponse.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return ApiResponse(
      success: map['success'],
      data: List<String>.from(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiResponse.fromJson(String source) => ApiResponse.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [success, data];
}