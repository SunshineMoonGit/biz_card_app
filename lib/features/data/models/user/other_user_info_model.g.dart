// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'other_user_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OtherUserInfoModelImpl _$$OtherUserInfoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OtherUserInfoModelImpl(
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
    );

Map<String, dynamic> _$$OtherUserInfoModelImplToJson(
        _$OtherUserInfoModelImpl instance) =>
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
    };
