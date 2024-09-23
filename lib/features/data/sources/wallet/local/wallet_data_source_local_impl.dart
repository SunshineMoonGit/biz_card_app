import 'package:biz_card_app/features/data/models/user/other_user_info_model.dart';
import 'package:biz_card_app/features/data/sources/wallet/local/wallet_data_source_local.dart';
import 'package:biz_card_app/shared/class/result_model/result.dart';
import 'package:biz_card_app/shared/services/hive/hive_service.dart';

class WalletDataSourceLocalImpl extends WalletDataSourceLocal {
  WalletDataSourceLocalImpl(this._storageService);

  final HiveStorageService _storageService;

  // 로컬에 저장된 데이터 가져오기
  @override
  Future<Result<List<OtherUserInfoModel>>> get() async {
    try {
      final List<OtherUserInfoModel> result = await _storageService.wallet.getUsers();

      return Result.success(result);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  // 로컬에 데이터 추가하기
  @override
  Future<Result> add(OtherUserInfoModel newData) async {
    try {
      await _storageService.wallet.add(newData);

      return Result.success('데이터 저장 성공!');
    } catch (e) {
      return Result.failure('데이터 저장 실패!');
    }
  }

  // 로컬 데이터 수정하기
  @override
  Future<Result> edit(String uid, OtherUserInfoModel data) async {
    try {
      await _storageService.wallet.edit(uid, data);

      return Result.success('데이터 수정 성공!');
    } catch (e) {
      return Result.failure('데이터 수정 실패!');
    }
  }

  @override
  Future<Result> delete(String uid) async {
    try {
      await _storageService.wallet.delete(uid);

      return Result.success('데이터 삭제 성공!');
    } catch (e) {
      return Result.failure('데이터 삭제 실패!');
    }
  }
}
