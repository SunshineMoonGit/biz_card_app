import 'package:biz_card_app/di/injector.dart';
import 'package:biz_card_app/features/data/models/user/other_user_info_model.dart';
import 'package:biz_card_app/features/domain/use_cases/wallet/wallet_local_use_case.dart';
import 'package:biz_card_app/features/domain/use_cases/wallet/wallet_network_use_case.dart';
import 'package:biz_card_app/shared/class/result_model/result.dart';
import 'package:biz_card_app/shared/provider/notification_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WalletProviderNotifier extends Notifier<List<OtherUserInfoModel>> {
  late final WalletLocalUseCase _localUseCase;
  late final WalletNetworkUseCase _networkUseCase;
  late final NotificationProviderNotifier _notificationService;

  @override
  List<OtherUserInfoModel> build() {
    _localUseCase = ref.watch(walletLocalUseCaseProvider);
    _networkUseCase = ref.watch(walletNetworkUseCaseProvider);
    _notificationService = ref.read(notificationProvider.notifier);

    return [];
  }

  Future<void> init() async {
    state = await _get();
  }

  Future<List<OtherUserInfoModel>> _get() async {
    // get local
    final Result<List<OtherUserInfoModel>> localResult = await _localUseCase.get();

    // // local result -> firebase 에서 isLinked 가 true 인 것만 데이터 변경
    // final List<OtherUserInfoModel> result = await _networkUseCase.update(localResult);

    return localResult.when(
      success: (value) => state = value,
      failure: (error) => state = [],
    );
  }

  Future<void> add(OtherUserInfoModel newData) async {
    final Result result = await _localUseCase.add(newData);

    result.when(
      success: (value) {
        state = [...state, newData];
        _notificationService.update(value);
      },
      failure: (message) => _notificationService.update(message),
    );
  }

  Future<void> edit(String uid, OtherUserInfoModel newData) async {
    final Result result = await _localUseCase.edit('123', newData);

    state = await _get();
    _notificationService.result(result);
  }

  Future<void> delete(String uid) async {
    final Result result = await _localUseCase.delete(uid);

    state = await _get();
    _notificationService.result(result);
    // result.when(
    //   success: (value) async {
    //     state = await _get();
    //     _notificationService.update(value);
    //   },
    //   failure: (message) => _notificationService.update(message),
    // );
  }
}

final walletProvider = NotifierProvider<WalletProviderNotifier, List<OtherUserInfoModel>>(() {
  return WalletProviderNotifier();
});
