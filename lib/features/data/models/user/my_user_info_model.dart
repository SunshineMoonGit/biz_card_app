import 'package:biz_card_app/config/app/app_enum.dart';
import 'package:biz_card_app/config/mapper/user_info_mapper.dart';
import 'package:biz_card_app/features/data/models/user/base_user_info_model.dart';
import 'package:biz_card_app/shared/class/external_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_user_info_model.freezed.dart';
part 'my_user_info_model.g.dart';

@freezed
class MyUserInfoModel with _$MyUserInfoModel implements BaseUserInfoModel {
  const MyUserInfoModel._();

  const factory MyUserInfoModel({
    required String uid,
    required String name,
    required String profileImage,
    required String cardImage,
    required String email,
    required String team,
    required String company,
    required String phone,
    required String fax,
    required List<ExternalModel> external,
    required String lastUpdate,
    required String createdAt,
    // only my user info model
    required UserType userType,
    required LoginType loginType,
    required String lastLoginAt,
  }) = _MyUserInfoModel;

  factory MyUserInfoModel.fromJson(Map<String, dynamic> json) => _$MyUserInfoModelFromJson(json);

  // 빈 값을 생성하는 팩토리 메서드
  factory MyUserInfoModel.empty() => const MyUserInfoModel(
        uid: '',
        name: '',
        profileImage: '',
        cardImage: '',
        email: '',
        team: '',
        company: '',
        phone: '',
        fax: '',
        external: [],
        lastUpdate: '',
        createdAt: '',
        userType: UserType.normal, // 기본값 설정
        loginType: LoginType.email, // 기본값 설정
        lastLoginAt: '',
      );

  factory MyUserInfoModel.fromUser(User user) {
    return UserInfoMapper.fromUser(user);
  }
}
