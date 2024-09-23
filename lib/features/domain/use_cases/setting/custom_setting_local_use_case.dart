import 'package:biz_card_app/features/data/models/setting/custom_setting_model.dart';
import 'package:biz_card_app/features/domain/repositories/setting/setting_repository.dart';

class CustomSettingLocalUseCase {
  final SettingRepository repository;

  CustomSettingLocalUseCase({required this.repository});

  Future<CustomSettingModel> init(String language) async {
    return await repository.customInit(language);
  }

  Future<void> update(CustomSettingModel newData) async {
    await repository.customUpdate(newData);
  }
}
