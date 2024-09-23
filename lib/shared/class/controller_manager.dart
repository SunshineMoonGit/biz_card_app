import 'package:biz_card_app/config/app/app_enum.dart';
import 'package:biz_card_app/shared/services/validator/validator_service.dart';
import 'package:flutter/material.dart';

class BasicController {
  final String name;
  late TextEditingController controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  //   // final List<TextInputFormatter>? inputFormatters;
  //     // 배경색
  // final Color? fillColor;
  // // 아이콘
  // final Widget? prefixIcon;
  // // 힌트
  // final String? hintText;

  BasicController({
    required this.name,
    this.validator,
    this.obscureText = false,
  }) : controller = TextEditingController();

  static List<BasicController> getByType(ControllerType cType) {
    switch (cType) {
      case ControllerType.signIn:
        return [
          BasicController(
            name: 'email',
            validator: (val) => ValidatorService.email(val),
          ),
          BasicController(
            name: 'password',
            validator: (val) => ValidatorService.password(val),
            obscureText: true,
          ),
        ];
      case ControllerType.signUp:
        return [
          BasicController(
            name: 'email',
            validator: (val) => ValidatorService.email(val),
          ),
          BasicController(
            name: 'password',
            validator: (val) => ValidatorService.password(val),
            obscureText: true,
          ),
          BasicController(
            name: 'password confirm',
            validator: (val) => ValidatorService.password(val),
            obscureText: true,
          ),
        ];
      case ControllerType.register:
        return [
          BasicController(
            name: 'name',
          ),
          BasicController(
            name: 'email',
            validator: (val) => ValidatorService.email(val),
          ),
          BasicController(
            name: 'company',
          ),
          BasicController(
            name: 'team',
          ),
          BasicController(
            name: 'phone',
          ),
          BasicController(
            name: 'fax',
          ),
        ];
      case ControllerType.search:
        return [
          BasicController(
            name: 'search',
            validator: (val) => ValidatorService.password(val),
          ),
        ];
      case ControllerType.edit:
        return [
          BasicController(
            name: 'edit',
            validator: (val) => ValidatorService.password(val),
          ),
        ];
    }
  }

  void dispose() {
    controller.dispose();
  }
}

class ControllerManager {
  List<BasicController> controllers = [];
  ControllerType type;

  ControllerManager({required this.type}) {
    controllers = BasicController.getByType(type);
  }

  void updateType(ControllerType newType) {
    if (type != newType) {
      disposeAll();
      type = newType;
      controllers = BasicController.getByType(newType);
    }
  }

  TextEditingController? getController(String name) {
    final controller = controllers.firstWhere((c) => c.name == name, orElse: () => BasicController(name: ''));
    return controller.name.isNotEmpty ? controller.controller : null;
  }

  String getValue(String name) {
    return getController(name)?.text ?? '';
  }

  void setValue(String name, String value) {
    final controller = getController(name);
    if (controller != null) {
      controller.text = value;
    }
  }

  Map<String, String> getAllValues() {
    return {for (var c in controllers) c.name: c.controller.text};
  }

  void clearAll() {
    for (var controller in controllers) {
      controller.controller.clear();
    }
  }

  void disposeAll() {
    for (var controller in controllers) {
      print('${controller.name} delete');
      controller.dispose();
    }
    controllers.clear();
  }

  String get name {
    if (type == ControllerType.register) {
      return getValue('name');
    }
    return '';
  }

  String get email {
    if (type == ControllerType.signIn || type == ControllerType.signUp || type == ControllerType.register) {
      return getValue('email');
    }
    return '';
  }

  String get password {
    if (type == ControllerType.signIn || type == ControllerType.signUp) {
      return getValue('password');
    }
    return '';
  }

  String get passwordConfirm {
    if (type == ControllerType.signIn || type == ControllerType.signUp) {
      return getValue('passwordConfirm');
    }
    return '';
  }

  String get team {
    if (type == ControllerType.register) {
      return getValue('team');
    }
    return '';
  }

  String get company {
    if (type == ControllerType.register) {
      return getValue('company');
    }
    return '';
  }

  String get phone {
    if (type == ControllerType.register) {
      return getValue('phone');
    }
    return '';
  }

  String get fax {
    if (type == ControllerType.register) {
      return getValue('fax');
    }
    return '';
  }
}
