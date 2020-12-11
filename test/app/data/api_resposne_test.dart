import 'dart:convert';

import 'package:contact_me/app/data/api_resposne.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fixtures/api_response_mock.dart';

void main() {
  group('ApiResposneTest -', () {
    group('toMap -', () {
      test('when called with valid ApiResponse, should return valid map', () {
        var testMap = apiResponseMock.toMap();
        expect(testMap, equals(apiResponseMockMap));
      });
    });

    group('fromMap -', () {
      test('when called with valid map, should return valid ApiResponse', () {
        var testResponse = ApiResponse.fromMap(apiResponseMockMap);
        expect(testResponse, equals(apiResponseMock));
      });
    });

    group('toJson -', () {
      test(
          'when called with valid ApiResponse, should return valid json String',
          () {
        var testJson = apiResponseMock.toJson();
        expect(testJson, equals(json.encode(apiResponseMockMap)));
      });
    });

    group('fromJson -', () {
      test(
          'when called with valid json String, should return valid ApiResponse',
          () {
        var testResponse =
            ApiResponse.fromJson(json.encode(apiResponseMockMap));
        expect(testResponse, equals(apiResponseMock));
      });
    });
  });
}
