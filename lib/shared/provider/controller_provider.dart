// import 'package:biz_card_app/config/app/app_enum.dart';
// import 'package:biz_card_app/shared/controller_manager/basic_controller_manager.dart';
// import 'package:biz_card_app/shared/controller_manager/edit_controller_manager.dart';
// import 'package:biz_card_app/shared/controller_manager/register_controller_manager.dart';
// import 'package:biz_card_app/shared/controller_manager/search_controller_manager.dart';
// import 'package:biz_card_app/shared/controller_manager/sign_in_controller_manager.dart';
// import 'package:biz_card_app/shared/controller_manager/sign_up_controller_manager.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class ControllerProviderNotifier extends FamilyNotifier<BasicControllerManager, ControllerType> {
//   @override
//   BasicControllerManager build(ControllerType arg) {
//     return ControllerManager(arg, ref).manager;
//   }

//   void dispose() {
//     // print('dispose');
//     state.dispose(); // 각 컨트롤러의 dispose 메서드를 호출
//     state = NoneControllerManager();
//   }
// }

// final controllerProvider = NotifierProviderFamily<ControllerProviderNotifier, BasicControllerManager, ControllerType>(
//     ControllerProviderNotifier.new);

// extension ControllerProviderExtension on WidgetRef {
//   SignInControllerManager watchSignInController() {
//     return watch(controllerProvider(ControllerType.signIn)) as SignInControllerManager;
//   }

//   SignUpControllerManager watchSignUpController() {
//     return watch(controllerProvider(ControllerType.signUp)) as SignUpControllerManager;
//   }

//   RegisterControllerManager watchRegisterController() {
//     return watch(controllerProvider(ControllerType.register)) as RegisterControllerManager;
//   }

//   SearchControllerManager watchSearchController() {
//     return watch(controllerProvider(ControllerType.search)) as SearchControllerManager;
//   }

//   EditControllerManager watchEditController() {
//     return watch(controllerProvider(ControllerType.edit)) as EditControllerManager;
//   }
// }


