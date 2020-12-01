import 'dart:io';

import 'package:contact_me/app/data/home_repository/home_repository.dart';
import 'package:contact_me/app/data/home_repository/home_repository_impl.dart';
import 'package:contact_me/app/modules/contact/controllers/contact_controller.dart';
import 'package:contact_me/app/modules/contact/data/user_args.dart';
import 'package:contact_me/app/services/http_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:matcher/matcher.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/user_args_mock.dart';

class HomeRepositoryMock extends Mock implements HomeRepository {}

void main() {
  group('ContactControllerTest -', () {
    final HomeRepositoryMock homeRepository = HomeRepositoryMock();

    BindingsBuilder bindingsBuilder = BindingsBuilder(() {
      Get.lazyPut<ContactController>(() => ContactController(homeRepository));
    });
    ContactController controller;
    setUp(() {
      bindingsBuilder.builder();
      controller = Get.find();
      controller.userArgs.value = UserArgs.fromMap(mockUserArgsMap);
    });
    tearDown(Get.reset);

    group('onInit -', () {
      test('before call, controller should not be in memory', () {
        // arrange
        Get.reset();
        // assert
        expect(
          () => Get.find<ContactController>(),
          throwsA(
            TypeMatcher<String>(),
          ),
        );
      });

      test(
        'when called, controller should be in memory',
        () async {
          expect(controller.initialized, isTrue);
        },
      );

      test(
        'when called, status should be success',
        () async {
          expect(controller.status.isSuccess, isTrue);
        },
      );

      /// TODO: Need to be able to test get arguments
      test(
        'when called, should set the value of fields from Get.arguments',
        () async {
          // assert
          expect(controller.userArgs.value, equals(mockUserArgs));
        },
      );
    });

    group('handleActuallyCreateApp -', () {
      test('when called, should call homeRepository.getNewApp', () async {
        // arrange
        when(homeRepository.getNewApp(any))
            .thenAnswer((_) => Future.value(File('')));
        // act
        await controller.handleActuallyCreateApp();
        // assert
        verify(homeRepository.getNewApp(mockUserArgs)).called(1);
      });

      test(
          'when called and homeRepository.getNewApp returns a valid app, '
          'controller.status.isSuccess should be true', () async {
        // arrange
        when(homeRepository.getNewApp(any))
            .thenAnswer((_) => Future.value(File('')));
        // act
        await controller.handleActuallyCreateApp();
        // assert
        expect(controller.status.isSuccess, isTrue);
      });

      test(
          'when called and homeRepository.getNewApp returns an invalid, '
          'controller.status.isError should be true', () async {
        // arrange
        when(homeRepository.getNewApp(any))
            .thenAnswer((realInvocation) => Future.error(Error()));
        // act
        await controller.handleActuallyCreateApp();
        // assert
        expect(controller.status.isError, isTrue);
      });
    });
  });
}
