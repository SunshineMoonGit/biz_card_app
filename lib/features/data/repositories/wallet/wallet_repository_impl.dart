import 'dart:io';

import 'package:biz_card_app/features/data/models/user/other_user_info_model.dart';
import 'package:biz_card_app/features/data/sources/wallet/local/wallet_data_source_local.dart';
import 'package:biz_card_app/features/data/sources/wallet/network/wallet_data_source_network.dart';
import 'package:biz_card_app/features/domain/repositories/wallet/wallet_repository.dart';
import 'package:biz_card_app/shared/class/result_model/result.dart';

class WalletRepositoryImpl extends WalletRepository {
  final WalletDataSourceLocal localDataSource;
  final WalletDataSourceNetwork networkDataSource;

  WalletRepositoryImpl({
    required this.localDataSource,
    required this.networkDataSource,
  });

  @override
  Future<Result<String>> addNetwork(String uid, OtherUserInfoModel newData, File? cardImage) async {
    return await networkDataSource.add(uid, newData, cardImage);
  }

  @override
  Future<Result<List<OtherUserInfoModel>>> update(List<OtherUserInfoModel> followings) async {
    return await networkDataSource.update(followings);
  }

  @override
  Future<Result<List<OtherUserInfoModel>>> getLocal() async {
    return await localDataSource.get();
  }

  @override
  Future<Result> addLocal(OtherUserInfoModel newData) async {
    return await localDataSource.add(newData);
  }

  @override
  Future<Result> editLocal(String uid, OtherUserInfoModel data) async {
    return await localDataSource.edit(uid, data);
  }

  @override
  Future<Result> deleteLocal(String uid) async {
    return await localDataSource.delete(uid);
  }
}
