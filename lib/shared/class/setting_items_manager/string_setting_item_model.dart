import 'package:biz_card_app/shared/class/setting_items_manager/basic_setting_item_model.dart';

class StringSettingItemModel extends BasicSettingItemModel {
  final Function() onSave;

  StringSettingItemModel({
    super.icon,
    required super.title,
    required super.description,
    required super.settingType,
    required super.onNavigate,
    required this.onSave,
    super.value,
  }) : super();
}
