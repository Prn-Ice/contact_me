import 'dart:convert';

import 'package:contact_me/app/modules/contact/data/user_args.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';
import '../../../../fixtures/user_args_mock.dart';

void main() {
  group('UserArgsTest -', () {
    group('fromMap -', () {
      test('when called with a valid map, should return a valid UserArgs', () {
        // arrange
        final userArgsMap = json.decode(fixtureReader('user_args.json'));
        // act
        final userArgs = UserArgs.fromMap(userArgsMap);
        // assert
        expect(userArgs, equals(mockUserArgs));
      });
    });

    group('toMap -', () {
      test('when called with valid UserArgs, should return a valid map', () {
        // arrange, act
        final map = mockUserArgs.toMap();
        // assert
        expect(map, mockUserArgsMap);
      });
    });
  });
}
