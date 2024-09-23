import 'package:biz_card_app/config/app/app_path.dart';
import 'package:biz_card_app/features/data/models/user/my_user_info_model.dart';
import 'package:hive/hive.dart';

class AuthStorageService {
  final Box _box;

  AuthStorageService(this._box);

  Future<void> update(MyUserInfoModel newData) async {
    // 새로 갈아없기
    await _box.put(AppPath.localAuth, newData.toJson());
  }

  Future<MyUserInfoModel?> get() async {
    final dynamic hiveDataDynamic = _box.get(AppPath.localAuth);

    if (hiveDataDynamic == null) {
      // 데이터가 없을 때의 처리
      // 예: null을 반환하거나, 기본값을 사용하거나, 예외를 throw
      return null; // 또는 throw Exception("Auth data not found");
    }

    if (hiveDataDynamic is! Map<dynamic, dynamic>) {
      // 예상치 못한 데이터 형식일 때의 처리
      throw Exception("Invalid data format for auth info");
    }

    Map<String, dynamic> hiveData = hiveDataDynamic.map((key, value) {
      return MapEntry(key.toString(), value);
    });

    return MyUserInfoModel.fromJson(hiveData);
  }

  Future<void> signOut() async {
    await _box.clear();
  }
}
