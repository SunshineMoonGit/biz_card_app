// import 'package:biz_card_app/shared/class/controller_manager.dart';
// import 'package:biz_card_app/shared/services/input_formatters/phone_input_formatter.dart';
// import 'package:biz_card_app/shared/services/validator/validator_service.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class TextFormFieldModel {
//   final Icon? icon;
//   final String title;
//   final TextEditingController controller;
//   final String? Function(String val)? validator;
//   final List<TextInputFormatter>? inputFormatters;
//   final bool obscureText;

//   const TextFormFieldModel({
//     this.icon,
//     required this.title,
//     required this.controller,
//     this.validator,
//     this.inputFormatters,
//     this.obscureText = false,
//   });

//   static List<TextFormFieldModel> getByController(ControllerManager manager) {
//     return manager.controllers.map((e) => TextFormFieldModel(title: e.name, controller: e.controller)).toList();
//     // switch (manager.type) {
//     //   case ControllerType.signIn:
//     //     return _login(manager.controllers);
//     //   case ControllerType.signUp:
//     //     return _signUp(manager);
//     //   case ControllerType.register:
//     //     return _register(manager);
//     //   default:
//     //     return [];
//     // }
//   }
// }

// List<TextFormFieldModel> _login(List<BasicController> controllers) {
//   return [
//     TextFormFieldModel(
//       title: controllers[0].name,
//       controller: controllers[0].controller,
//       validator: (val) => ValidatorService.email(val),
//     ),
//     TextFormFieldModel(
//       title: controllers[1].name,
//       controller: controllers[1].controller,
//       validator: (val) => ValidatorService.password(val),
//       obscureText: true,
//     ),
//   ];
// }

// List<TextFormFieldModel> _signUp(ControllerManager controllers) {
//   return [
//     TextFormFieldModel(
//       title: 'email',
//       controller: controllers[0],
//       validator: (val) => ValidatorService.email(val),
//     ),
//     TextFormFieldModel(
//       title: 'pw',
//       controller: controllers[1],
//       validator: (val) => ValidatorService.password(val),
//       obscureText: true,
//     ),
//     TextFormFieldModel(
//       title: 'pw check',
//       controller: controllers[2],
//       validator: (val) {
//         if (val != controllers[1].text) {
//           return '비밀번호가 일치하지 않습니다.';
//         }
//         return null;
//       },
//       obscureText: true,
//     ),
//   ];
// }

// List<TextFormFieldModel> _register(ControllerManager controllers) {
//   return [
//     TextFormFieldModel(
//       icon: const Icon(Icons.person),
//       title: 'name',
//       controller: controllers[0],
//       validator: (val) => ValidatorService.name(val),
//     ),
//     TextFormFieldModel(
//       icon: const Icon(Icons.email),
//       title: 'email',
//       controller: controllers[1],
//       validator: (val) {
//         if (val.isNotEmpty ?? false) {
//           return ValidatorService.email(val);
//         }
//         return null;
//       },
//     ),
//     TextFormFieldModel(
//       icon: const Icon(Icons.people),
//       title: 'team',
//       controller: controllers[2],
//       validator: (val) => null,
//     ),
//     TextFormFieldModel(
//       icon: const Icon(Icons.apartment),
//       title: 'company',
//       controller: controllers[3],
//       validator: (val) => null,
//     ),
//     TextFormFieldModel(
//       icon: const Icon(Icons.phone),
//       title: 'phone',
//       controller: controllers[4],
//       validator: (val) => null,
//       inputFormatters: [
//         FilteringTextInputFormatter.digitsOnly,
//         PhoneInputFormatter(),
//         LengthLimitingTextInputFormatter(13),
//       ],
//     ),
//     TextFormFieldModel(
//       icon: const Icon(Icons.fax),
//       title: 'fax',
//       controller: controllers[5],
//       validator: (val) => null,
//     ),
//   ];
// }
