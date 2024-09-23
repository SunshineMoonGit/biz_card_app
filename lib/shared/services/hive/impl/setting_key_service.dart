import 'package:biz_card_app/config/app/app_path.dart';
import 'package:biz_card_app/features/data/models/setting/key_setting_model.dart';
import 'package:hive/hive.dart';

class SettingKeyService {
  final Box _box;

  SettingKeyService(this._box);

  Future<void> update(KeySettingModel settingData) async {
    await _box.put(AppPath.localKey, settingData);
  }

  Future<void> delete() async {
    await _box.delete(AppPath.localKey);
  }

  Future<KeySettingModel> get() async {
    KeySettingModel? hiveData = _box.get(AppPath.localKey);
    return hiveData ??
        KeySettingModel(
          updateTime: DateTime.now().toIso8601String(),
          favorites: [],
          recent: [],
        );
  }

  Future<void> set(KeySettingModel data) async {
    await _box.put(AppPath.localKey, data);
  }
}
