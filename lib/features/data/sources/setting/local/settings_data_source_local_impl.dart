import 'package:biz_card_app/features/data/models/setting/custom_setting_model.dart';
import 'package:biz_card_app/features/data/models/setting/key_setting_model.dart';
import 'package:biz_card_app/features/data/sources/setting/local/settings_data_source_local.dart';
import 'package:biz_card_app/shared/services/hive/hive_service.dart';

class SettingsDataSourceLocalImpl extends SettingsDataSourceLocal {
  SettingsDataSourceLocalImpl(this._storageService);

  final HiveStorageService _storageService;

  @override
  Future<CustomSettingModel> customInit(String language) async {
    try {
      final CustomSettingModel data = await _storageService.custom.get();

      return data;
    } catch (e) {
      final CustomSettingModel data = CustomSettingModel.init(language);
      await _storageService.custom.set(data);
      return data;
    }
  }

  @override
  Future<void> customUpdate(CustomSettingModel newData) async {
    await _storageService.custom.update(newData);
  }

  @override
  Future<KeySettingModel> keyInit() async {
    try {
      final KeySettingModel data = await _storageService.key.get();

      return data;
    } catch (e) {
      final KeySettingModel data = KeySettingModel.init();
      await _storageService.key.set(data);
      return data;
    }
  }

  @override
  Future<void> keyUpdate(KeySettingModel newData) async {
    await _storageService.key.update(newData);
  }
}
