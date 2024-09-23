import 'package:biz_card_app/features/data/models/user/other_user_info_model.dart';
import 'package:biz_card_app/shared/class/result_model/result.dart';

abstract class WalletDataSourceLocal {
  Future<Result<List<OtherUserInfoModel>>> get();
  Future<Result> add(OtherUserInfoModel newData);
  Future<Result> edit(String uid, OtherUserInfoModel data);
  Future<Result> delete(String uid);
}
