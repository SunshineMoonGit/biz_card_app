import 'package:biz_card_app/features/data/models/user/other_user_info_model.dart';
import 'package:biz_card_app/features/domain/repositories/wallet/wallet_repository.dart';
import 'package:biz_card_app/shared/class/result_model/result.dart';

class WalletLocalUseCase {
  final WalletRepository repository;

  WalletLocalUseCase({required this.repository});

  // 유저 정보 가져오기
  Future<Result<List<OtherUserInfoModel>>> get() async {
    return await repository.getLocal();
  }

  Future<Result> add(OtherUserInfoModel newData) async {
    return await repository.addLocal(newData);
  }

  // 유저 정보 수정하기
  Future<Result> edit(String uid, OtherUserInfoModel data) async {
    return await repository.editLocal(uid, data);
  }

  Future<Result> delete(String uid) async {
    return await repository.deleteLocal(uid);
  }
}
