import 'dart:io';

import 'package:biz_card_app/features/data/models/user/other_user_info_model.dart';
import 'package:biz_card_app/features/domain/repositories/wallet/wallet_repository.dart';
import 'package:biz_card_app/shared/class/result_model/result.dart';

class WalletNetworkUseCase {
  final WalletRepository repository;

  WalletNetworkUseCase({required this.repository});

  Future<List<OtherUserInfoModel>> update(List<OtherUserInfoModel> followings) async {
    Result<List<OtherUserInfoModel>> result = await repository.update(followings);

    return result.when(
      success: (value) => value,
      failure: (message) => [],
    );
  }

  Future<Result<String>> add(String uid, OtherUserInfoModel newData, File? cardImage) async {
    Result<String> result = await repository.addNetwork(uid, newData, cardImage);

    return result.when(
      success: (value) => Result.success(value),
      failure: (message) => Result.failure(message),
    );
  }
}
