import 'package:biz_card_app/features/data/models/user/my_user_info_model.dart';
import 'package:biz_card_app/shared/class/result_model/result.dart';

abstract class AuthDataSourceLocal {
  // Future<AuthState> check();
  Future<Result<MyUserInfoModel>> get();

  Future<Result> update(MyUserInfoModel data);

  Future<Result> signOut();
}
