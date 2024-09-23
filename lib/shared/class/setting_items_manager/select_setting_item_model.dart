import 'package:biz_card_app/shared/class/setting_items_manager/basic_setting_item_model.dart';

class SelectSettingItemModel extends BasicSettingItemModel {
  final List<SettingOption> options;

  SelectSettingItemModel({
    super.icon,
    required super.title,
    required super.description,
    required super.settingType,
    required super.onNavigate,
    required this.options,
    super.value,
  }) : super();
}

class SettingOption {
  final String title;
  final Function() onTap;
  final bool value;

  SettingOption({
    required this.title,
    required this.onTap,
    this.value = false,
  });
}
