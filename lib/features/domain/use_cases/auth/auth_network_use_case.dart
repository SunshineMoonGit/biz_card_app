import 'package:biz_card_app/features/data/models/user/my_user_info_model.dart';
import 'package:biz_card_app/features/domain/repositories/auth/auth_repository.dart';
import 'package:biz_card_app/shared/class/result_model/result.dart';

class AuthNetworkUseCase {
  final AuthRepository repository;

  AuthNetworkUseCase({required this.repository});

  Future<Result<MyUserInfoModel>> get(String uid) async {
    return await repository.getNetwork(uid);
  }

  Future<Result<MyUserInfoModel>> signUpWithEmail(String email, String pw) async {
    return await repository.signUpWithEmail(email, pw);
  }

  Future<Result<MyUserInfoModel>> signInWithEmail(String email, String pw) async {
    return await repository.signInWithEmail(email, pw);
  }

  Future<Result<MyUserInfoModel>> signInWithGoogle() async {
    return await repository.signInWithGoogle();
  }

  Future<Result> update(MyUserInfoModel updateData) async {
    return await repository.updateNetwork(updateData);
  }
}
