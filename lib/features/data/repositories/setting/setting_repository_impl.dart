import 'package:biz_card_app/features/data/models/setting/custom_setting_model.dart';
import 'package:biz_card_app/features/data/models/setting/key_setting_model.dart';
import 'package:biz_card_app/features/data/sources/setting/local/settings_data_source_local.dart';
import 'package:biz_card_app/features/domain/repositories/setting/setting_repository.dart';

class SettingRepositoryImpl extends SettingRepository {
  final SettingsDataSourceLocal dataSource;

  SettingRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<CustomSettingModel> customInit(String language) async {
    final CustomSettingModel result = await dataSource.customInit(language);

    return result;
  }

  @override
  Future<void> customUpdate(CustomSettingModel newData) {
    return dataSource.customUpdate(newData);
  }

  @override
  Future<KeySettingModel> keyInit() async {
    final KeySettingModel result = await dataSource.keyInit();

    return result;
  }

  @override
  Future<void> keyUpdate(KeySettingModel newData) async {
    return dataSource.keyUpdate(newData);
  }
}
