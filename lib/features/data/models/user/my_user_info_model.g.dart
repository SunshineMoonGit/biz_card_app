// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_user_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyUserInfoModelImpl _$$MyUserInfoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MyUserInfoModelImpl(
      uid: json['uid'] as String,
      name: json['name'] as String,
      profileImage: json['profileImage'] as String,
      cardImage: json['cardImage'] as String,
      email: json['email'] as String,
      team: json['team'] as String,
      company: json['company'] as String,
      phone: json['phone'] as String,
      fax: json['fax'] as String,
      external: (json['external'] as List<dynamic>)
          .map((e) => ExternalModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastUpdate: json['lastUpdate'] as String,
      createdAt: json['createdAt'] as String,
      userType: $enumDecode(_$UserTypeEnumMap, json['userType']),
      loginType: $enumDecode(_$LoginTypeEnumMap, json['loginType']),
      lastLoginAt: json['lastLoginAt'] as String,
    );

Map<String, dynamic> _$$MyUserInfoModelImplToJson(
        _$MyUserInfoModelImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'profileImage': instance.profileImage,
      'cardImage': instance.cardImage,
      'email': instance.email,
      'team': instance.team,
      'company': instance.company,
      'phone': instance.phone,
      'fax': instance.fax,
      'external': instance.external,
      'lastUpdate': instance.lastUpdate,
      'createdAt': instance.createdAt,
      'userType': _$UserTypeEnumMap[instance.userType]!,
      'loginType': _$LoginTypeEnumMap[instance.loginType]!,
      'lastLoginAt': instance.lastLoginAt,
    };

const _$UserTypeEnumMap = {
  UserType.normal: 'normal',
  UserType.premium: 'premium',
  UserType.master: 'master',
};

const _$LoginTypeEnumMap = {
  LoginType.none: 'none',
  LoginType.email: 'email',
  LoginType.google: 'google',
  LoginType.naver: 'naver',
  LoginType.kakao: 'kakao',
};
