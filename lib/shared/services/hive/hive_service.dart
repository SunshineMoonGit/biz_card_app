import 'package:biz_card_app/config/app/app_path.dart';
import 'package:biz_card_app/shared/services/hive/impl/auth_storage_service.dart';
import 'package:biz_card_app/shared/services/hive/impl/setting_custom_service.dart';
import 'package:biz_card_app/shared/services/hive/impl/setting_key_service.dart';
import 'package:biz_card_app/shared/services/hive/impl/wallet_storage_service.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class StorageService {
  SettingKeyService get key;
  SettingCustomService get custom;
  AuthStorageService get auth;
  WalletStorageService get wallet;

  static Future<void> initialize() async {
    await Hive.initFlutter();

    await Future.wait([
      Hive.openBox(AppPath.localAuth),
      Hive.openBox(AppPath.localFollowings),
      Hive.openBox(AppPath.localKey),
      Hive.openBox(AppPath.localCustom),
    ]);
  }
}

// Hive를 사용한 구현
class HiveStorageService implements StorageService {
  @override
  final SettingKeyService key;
  @override
  final SettingCustomService custom;
  @override
  final AuthStorageService auth;
  @override
  final WalletStorageService wallet;

  HiveStorageService({
    required Box authBox,
    required Box walletBox,
    required Box keySettingBox,
    required Box customSettingBox,
  })  : auth = AuthStorageService(authBox),
        wallet = WalletStorageService(walletBox),
        key = SettingKeyService(keySettingBox),
        custom = SettingCustomService(customSettingBox);

  static Map<String, dynamic> convertDynamicMap(Map<dynamic, dynamic> dynamicMap) {
    return dynamicMap.map((key, value) => MapEntry(key.toString(), value));
  }
}
