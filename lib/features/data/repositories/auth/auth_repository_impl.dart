import 'package:biz_card_app/features/data/models/user/my_user_info_model.dart';
import 'package:biz_card_app/features/data/sources/auth/local/auth_data_source_local.dart';
import 'package:biz_card_app/features/data/sources/auth/network/auth_data_source_network.dart';
import 'package:biz_card_app/features/domain/repositories/auth/auth_repository.dart';
import 'package:biz_card_app/shared/class/result_model/result.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDataSourceLocal dataSourceLocal;
  final AuthDataSourceNetwork dataSourceNetwork;

  AuthRepositoryImpl({
    required this.dataSourceLocal,
    required this.dataSourceNetwork,
  });
  @override
  Future<Result<MyUserInfoModel>> signUpWithEmail(String email, String pw) async {
    return await dataSourceNetwork.signUpWithEmail(email, pw);
  }

  @override
  Future<Result<MyUserInfoModel>> signInWithEmail(String email, String pw) async {
    return await dataSourceNetwork.signInWithEmail(email, pw);
  }

  @override
  Future<Result<MyUserInfoModel>> signInWithGoogle() async {
    return await dataSourceNetwork.signInWithGoogle();
  }

  @override
  Future<Result<MyUserInfoModel>> getNetwork(String uid) async {
    return await dataSourceNetwork.get(uid);
  }

  @override
  Future<Result> updateNetwork(MyUserInfoModel data) async {
    return await dataSourceNetwork.update(data);
  }

  // local
  @override
  Future<Result<MyUserInfoModel>> getLocal() async {
    return await dataSourceLocal.get();
  }

  @override
  Future<void> signOut() async {
    await dataSourceLocal.signOut();
  }

  @override
  Future<Result> updateLocal(MyUserInfoModel data) async {
    return await dataSourceLocal.update(data);
  }
}
