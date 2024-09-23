import 'package:biz_card_app/features/data/models/user/other_user_info_model.dart';
import 'package:hive/hive.dart';

class WalletStorageService {
  WalletStorageService(this._box);

  final Box _box;
  final String _key = 'users';

  // 로컬에 저장된 데이터 가져오기
  Future<List<OtherUserInfoModel>> getUsers() async {
    try {
      var data = await _box.get(_key);

      if (data is List) {
        return data.map((item) {
          if (item is Map) {
            return OtherUserInfoModel.fromJson(Map<String, dynamic>.from(item));
          } else {
            throw Exception('Invalid data format');
          }
        }).toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  // 로컬에 데이터 추가하기
  Future<void> add(OtherUserInfoModel newData) async {
    try {
      List<OtherUserInfoModel> currentList = await getUsers();
      currentList.add(newData);
      await _box.put(_key, currentList.map((e) => e.toJson()).toList());
    } catch (e) {
      print('Error adding data: $e');
    }
  }

  // 로컬에 데이터 수정하기
  Future<void> edit(String uid, OtherUserInfoModel data) async {
    List<OtherUserInfoModel> currentList = await getUsers();
    int editIndex = currentList.indexWhere((element) => element.uid == uid);
    if (editIndex != -1) {
      currentList[editIndex] = data;
      await _box.put(_key, currentList.map((e) => e.toJson()).toList());
    }
  }

  void deleteAll() async {
    await _box.clear();
  }

  Future<void> delete(String uid) async {
    List<OtherUserInfoModel> currentList = await getUsers();
    int deleteIndex = currentList.indexWhere((element) => element.uid == uid);
    if (deleteIndex != -1) {
      currentList.removeAt(deleteIndex);
      await _box.put(_key, currentList.map((e) => e.toJson()).toList());
    }
  }

  Future<void> set(List<OtherUserInfoModel> networkData) async {
    await _box.put(_key, networkData);
  }
}
