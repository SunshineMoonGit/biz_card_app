import 'package:biz_card_app/features/data/models/user/my_user_info_model.dart';
import 'package:biz_card_app/features/domain/repositories/auth/auth_repository.dart';
import 'package:biz_card_app/shared/class/result_model/result.dart';

class AuthLocalUseCase {
  final AuthRepository repository;

  AuthLocalUseCase({required this.repository});

  Future<Result<MyUserInfoModel>> get() async {
    return await repository.getLocal();
  }

  Future<void> signOut() async {
    await repository.signOut();
  }

  Future<Result> update(MyUserInfoModel updateData) async {
    return await repository.updateLocal(updateData);
  }
}
