import 'dart:io';

import 'package:biz_card_app/config/mapper/user_info_mapper.dart';
import 'package:biz_card_app/features/data/models/user/base_user_info_model.dart';
import 'package:biz_card_app/shared/class/controller_manager.dart';
import 'package:biz_card_app/shared/class/external_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'other_user_info_model.freezed.dart';
part 'other_user_info_model.g.dart';

@freezed
class OtherUserInfoModel with _$OtherUserInfoModel implements BaseUserInfoModel {
  const OtherUserInfoModel._();

  const factory OtherUserInfoModel({
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
  }) = _OtherUserInfoModel;

  factory OtherUserInfoModel.fromJson(Map<String, dynamic> json) => _$OtherUserInfoModelFromJson(json);


  factory OtherUserInfoModel.fromController(File? imagePath, String uid, ControllerManager controllers) {
    return UserInfoMapper.fromController(imagePath, uid, controllers);
  }
}
