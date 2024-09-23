import 'package:biz_card_app/features/data/models/setting/key_setting_model.dart';
import 'package:biz_card_app/features/domain/repositories/setting/setting_repository.dart';

class KeySettingLocalUseCase {
  final SettingRepository repository;

  KeySettingLocalUseCase({required this.repository});

  Future<KeySettingModel> init() async {
    return await repository.keyInit();
  }

  Future<void> update(KeySettingModel newData) async {
    await repository.keyUpdate(newData);
  }
}
