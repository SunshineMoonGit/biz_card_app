import 'package:biz_card_app/config/app/app_path.dart';
import 'package:biz_card_app/features/data/repositories/auth/auth_repository_impl.dart';
import 'package:biz_card_app/features/data/repositories/setting/setting_repository_impl.dart';
import 'package:biz_card_app/features/data/repositories/wallet/wallet_repository_impl.dart';
import 'package:biz_card_app/features/data/sources/auth/local/auth_data_source_local.dart';
import 'package:biz_card_app/features/data/sources/auth/local/auth_data_source_local_impl.dart';
import 'package:biz_card_app/features/data/sources/auth/network/auth_data_source_network.dart';
import 'package:biz_card_app/features/data/sources/auth/network/auth_data_source_network_impl.dart';
import 'package:biz_card_app/features/data/sources/setting/local/settings_data_source_local.dart';
import 'package:biz_card_app/features/data/sources/setting/local/settings_data_source_local_impl.dart';
import 'package:biz_card_app/features/data/sources/wallet/local/wallet_data_source_local.dart';
import 'package:biz_card_app/features/data/sources/wallet/local/wallet_data_source_local_impl.dart';
import 'package:biz_card_app/features/data/sources/wallet/network/wallet_data_source_network.dart';
import 'package:biz_card_app/features/data/sources/wallet/network/wallet_data_source_network_impl.dart';
import 'package:biz_card_app/features/domain/repositories/auth/auth_repository.dart';
import 'package:biz_card_app/features/domain/repositories/setting/setting_repository.dart';
import 'package:biz_card_app/features/domain/repositories/wallet/wallet_repository.dart';
import 'package:biz_card_app/features/domain/use_cases/auth/auth_local_use_case.dart';
import 'package:biz_card_app/features/domain/use_cases/auth/auth_network_use_case.dart';
import 'package:biz_card_app/features/domain/use_cases/setting/custom_setting_local_use_case.dart';
import 'package:biz_card_app/features/domain/use_cases/setting/key_setting_local_use_case.dart';
import 'package:biz_card_app/features/domain/use_cases/wallet/wallet_local_use_case.dart';
import 'package:biz_card_app/features/domain/use_cases/wallet/wallet_network_use_case.dart';
import 'package:biz_card_app/shared/services/hive/hive_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

// DataSources
final walletDataSourceLocalProvider =
    Provider<WalletDataSourceLocal>((ref) => WalletDataSourceLocalImpl(ref.watch(storageServiceProvider)));
final walletDataSourceNetworkProvider = Provider<WalletDataSourceNetwork>((ref) => WalletDataSourceNetworkImpl());

final authDataSourceLocalProvider =
    Provider<AuthDataSourceLocal>((ref) => AuthDataSourceLocalImpl(ref.watch(storageServiceProvider)));
final authDataSourceNetworkProvider =
    Provider<AuthDataSourceNetwork>((ref) => AuthDataSourceNetworkImpl(ref.watch(storageServiceProvider)));

final settingsDataSourceLocalProvider =
    Provider<SettingsDataSourceLocal>((ref) => SettingsDataSourceLocalImpl(ref.watch(storageServiceProvider)));

// Repositories
final walletRepositoryProvider = Provider<WalletRepository>((ref) => WalletRepositoryImpl(
      localDataSource: ref.watch(walletDataSourceLocalProvider),
      networkDataSource: ref.watch(walletDataSourceNetworkProvider),
    ));

final authRepositoryProvider = Provider<AuthRepository>((ref) => AuthRepositoryImpl(
      dataSourceLocal: ref.watch(authDataSourceLocalProvider),
      dataSourceNetwork: ref.watch(authDataSourceNetworkProvider),
    ));

final settingRepositoryProvider =
    Provider<SettingRepository>((ref) => SettingRepositoryImpl(dataSource: ref.watch(settingsDataSourceLocalProvider)));

// UseCases
final walletNetworkUseCaseProvider =
    Provider<WalletNetworkUseCase>((ref) => WalletNetworkUseCase(repository: ref.watch(walletRepositoryProvider)));

final walletLocalUseCaseProvider =
    Provider<WalletLocalUseCase>((ref) => WalletLocalUseCase(repository: ref.watch(walletRepositoryProvider)));

final authNetworkUseCaseProvider =
    Provider<AuthNetworkUseCase>((ref) => AuthNetworkUseCase(repository: ref.watch(authRepositoryProvider)));
final authLocalUseCaseProvider =
    Provider<AuthLocalUseCase>((ref) => AuthLocalUseCase(repository: ref.watch(authRepositoryProvider)));

final customSettingLocalUseCaseProvider = Provider<CustomSettingLocalUseCase>(
    (ref) => CustomSettingLocalUseCase(repository: ref.watch(settingRepositoryProvider)));

final keySettingLocalUseCaseProvider =
    Provider<KeySettingLocalUseCase>((ref) => KeySettingLocalUseCase(repository: ref.watch(settingRepositoryProvider)));

// LocalStorageService Provider
final storageServiceProvider = Provider<HiveStorageService>((ref) {
  return HiveStorageService(
    authBox: Hive.box(AppPath.localAuth),
    customSettingBox: Hive.box(AppPath.localCustom),
    keySettingBox: Hive.box(AppPath.localKey),
    walletBox: Hive.box(AppPath.localFollowings),
  );
});
