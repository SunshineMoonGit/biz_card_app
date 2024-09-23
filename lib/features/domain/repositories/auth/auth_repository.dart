import 'package:biz_card_app/features/data/models/user/my_user_info_model.dart';
import 'package:biz_card_app/shared/class/result_model/result.dart';

abstract class AuthRepository {
  // network
  Future<Result<MyUserInfoModel>> signUpWithEmail(String email, String pw);
  Future<Result<MyUserInfoModel>> signInWithEmail(String email, String pw);

  Future<Result<MyUserInfoModel>> signInWithGoogle();

  Future<Result<MyUserInfoModel>> getNetwork(String uid);

  Future<Result> updateNetwork(MyUserInfoModel data);

  // local
  Future<Result<MyUserInfoModel>> getLocal();

  Future<void> signOut();

  Future<Result> updateLocal(MyUserInfoModel data);
}
