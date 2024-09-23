import 'package:biz_card_app/features/data/models/user/my_user_info_model.dart';
import 'package:biz_card_app/features/data/sources/auth/local/auth_data_source_local.dart';
import 'package:biz_card_app/shared/class/result_model/result.dart';
import 'package:biz_card_app/shared/services/hive/hive_service.dart';

class AuthDataSourceLocalImpl extends AuthDataSourceLocal {
  AuthDataSourceLocalImpl(this._storageService);

  final HiveStorageService _storageService;

  @override
  Future<Result<MyUserInfoModel>> get() async {
    try {
      MyUserInfoModel? storage = await _storageService.auth.get();

      if (storage == null) {
        return Result.success(MyUserInfoModel.empty());
      }

      return Result.success(storage);
    } catch (e) {
      return Result.success(MyUserInfoModel.empty());
    }
  }

  @override
  Future<Result> update(MyUserInfoModel data) async {
    try {
      await _storageService.auth.update(data);
      return Result.success('로컬 데이터 저장 성공.');
    } catch (e) {
      return Result.failure('로컬 데이터 저장 실패.');
    }
  }

  @override
  Future<Result> signOut() async {
    try {
      await _storageService.auth.signOut();
      return Result.success('로그아웃 성공.');
    } catch (e) {
      return Result.failure('로그아웃 실패.');
    }
  }
}
