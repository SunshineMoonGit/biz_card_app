import 'dart:io';

import 'package:biz_card_app/features/data/models/user/other_user_info_model.dart';
import 'package:biz_card_app/shared/class/result_model/result.dart';

abstract class WalletRepository {
  // network
  Future<Result<List<OtherUserInfoModel>>> update(List<OtherUserInfoModel> followings);
  Future<Result<String>> addNetwork(String uid, OtherUserInfoModel newData, File? cardImage);

  // local
  Future<Result<List<OtherUserInfoModel>>> getLocal();
  Future<Result> addLocal(OtherUserInfoModel newData);
  Future<Result> editLocal(String uid, OtherUserInfoModel data);
  Future<Result> deleteLocal(String uid);
}
