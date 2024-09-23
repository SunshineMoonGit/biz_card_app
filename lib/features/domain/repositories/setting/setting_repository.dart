import 'package:biz_card_app/features/data/models/setting/custom_setting_model.dart';
import 'package:biz_card_app/features/data/models/setting/key_setting_model.dart';

abstract class SettingRepository {
  Future<CustomSettingModel> customInit(String language);
  Future<void> customUpdate(CustomSettingModel newData);

  Future<KeySettingModel> keyInit();
  Future<void> keyUpdate(KeySettingModel newData);
}
