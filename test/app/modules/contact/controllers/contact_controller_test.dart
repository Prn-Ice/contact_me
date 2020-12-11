import 'package:contact_me/app/modules/contact/controllers/contact_controller.dart';
import 'package:contact_me/app/modules/contact/data/contact_repository/contact_repository.dart';
import 'package:contact_me/app/modules/contact/data/user_args.dart';
import 'package:contact_me/app/routes/app_pages.dart';
import 'package:contact_me/app/services/hud_service.dart';
import 'package:contact_me/app/services/navigation_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:matcher/matcher.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/api_response_mock.dart';
import '../../../../fixtures/user_args_mock.dart';
import '../../../../mocks/hud_service_mock.dart';
import '../../../../mocks/navigation_service_mock.dart';

class ContactRepositoryMock extends Mock implements ContactRepository {}

void main() {
  group('ContactControllerTest -', () {
    ContactRepositoryMock contactRepository;
    BindingsBuilder bindingsBuilder;
    ContactController controller;
    HudServiceMock hudService;
    NavigationService navigationService;

    setUpAll(() {
      contactRepository = ContactRepositoryMock();
      hudService = HudServiceMock();
      navigationService = NavigationServiceMock();
      bindingsBuilder = BindingsBuilder(() {
        Get.lazyPut<HudService>(() => hudService);
        Get.lazyPut<NavigationService>(() => navigationService);
        Get.lazyPut<ContactController>(
            () => ContactController(contactRepository));
      });
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
      setUpAll(() async {
        when(contactRepository.getNewApp(any))
            .thenAnswer((_) => Future.value(apiResponseMock));
        await controller.handleActuallyCreateApp();
      });

      test('when called, should call contactRepository.getNewApp', () async {
        // assert
        verify(contactRepository.getNewApp(mockUserArgs)).called(1);
      });

      test(
          'when called and contactRepository.getNewApp returns a valid response, '
          'controller.status.isSuccess should be true', () async {
        // assert
        expect(controller.status.isSuccess, isTrue);
        verify(hudService.showSuccess(status: 'Great, Success!')).called(1);
      });

      test(
          'when called and contactRepository.getNewApp returns a valid response, '
          'navigate to Routes.DOWNLOAD', () async {
        // assert
        verify(navigationService.toNamed(
          Routes.DOWNLOAD,
          arguments: apiResponseMock,
        )).called(1);
      });

      test(
          'when called and contactRepository.getNewApp returns an invalid, '
          'controller.status.isError should be true', () async {
        // arrange
        when(contactRepository.getNewApp(any))
            .thenAnswer((realInvocation) => Future.error(Error()));
        // act
        await controller.handleActuallyCreateApp();
        // assert
        expect(controller.status.isError, isTrue);
        verify(hudService.showError(status: 'Failed with Error'));
      });
    });
  });
}
