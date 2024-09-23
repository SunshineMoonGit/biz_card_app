import 'package:biz_card_app/config/app/app_enum.dart';
import 'package:flutter/material.dart';

abstract class BasicSettingItemModel {
  // 아이콘
  final String? icon;

  // 타이틀 및 설명
  final String title;
  final String description;
  final String? value;

  // 해당 페이지로 이동
  final Function(BuildContext, BasicSettingItemModel) onNavigate;

  // 설정 방법 , 설정 타입
  // final InputType inputType;
  final SettingType settingType;

  // edit by select
  // List<SettingOption> options

  // edit by string
  // Function -> onSave

  // edit by bool(check)
  // Function -> onTap

  BasicSettingItemModel({
    this.icon,
    required this.title,
    required this.description,
    this.value,
    required this.onNavigate,
    required this.settingType,
  });
}


// class CheckBySettingItem extends BasicSettingItemModel {
//   final bool? value;
//   final List<BasicSettingItemModel>? checkList;

//   CheckBySettingItem({
//     super.icon,
//     required super.title,
//     this.value,
//     super.onNavigate,
//     this.checkList,
//     super.inputType = InputType.check,
//     super.onSave,
//   });
// }