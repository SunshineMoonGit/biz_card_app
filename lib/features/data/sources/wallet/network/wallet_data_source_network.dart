import 'dart:io';

import 'package:biz_card_app/features/data/models/user/other_user_info_model.dart';
import 'package:biz_card_app/shared/class/result_model/result.dart';

abstract class WalletDataSourceNetwork {
  Future<Result<List<OtherUserInfoModel>>> update(List<OtherUserInfoModel> followings);

  Future<Result<String>> add(String uid, OtherUserInfoModel newData, File? cardImage);
}
