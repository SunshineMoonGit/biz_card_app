import 'package:biz_card_app/config/app/app_path.dart';
import 'package:biz_card_app/features/data/models/setting/custom_setting_model.dart';
import 'package:biz_card_app/shared/services/hive/hive_service.dart';
import 'package:hive/hive.dart';

class SettingCustomService {
  final Box _box;

  SettingCustomService(this._box);

  Future<void> update(CustomSettingModel settingData) async {
    await _box.put(AppPath.localCustom, settingData.toJson());
  }

  Future<CustomSettingModel> get() async {
    final Map<dynamic, dynamic>? localData = await _box.get(AppPath.localCustom);

    if (localData == null) {
      throw Exception('Local data not found');
    }
    return CustomSettingModel.fromJson(HiveStorageService.convertDynamicMap(localData));
  }

  Future<void> set(CustomSettingModel data) async {
    await _box.put(AppPath.localCustom, data.toJson());
  }
}
