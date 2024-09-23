import 'dart:io';

import 'package:biz_card_app/config/app/app_enum.dart';
import 'package:biz_card_app/features/data/models/user/my_user_info_model.dart';
import 'package:biz_card_app/features/data/models/user/other_user_info_model.dart';
import 'package:biz_card_app/shared/class/controller_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserInfoMapper {
  static MyUserInfoModel fromUser(User user) {
    return MyUserInfoModel(
      uid: user.uid,
      userType: UserType.normal,
      loginType: _getLoginType(user),
      name: user.displayName ?? '',
      profileImage: user.photoURL ?? '',
      cardImage: '',
      email: user.email ?? '',
      team: '',
      company: '',
      phone: '',
      fax: '',
      lastUpdate: '',
      external: [],
      createdAt: '',
      lastLoginAt: '',
    );
  }

  static fromController(File? imagePath, String uid, ControllerManager manager) {
    return OtherUserInfoModel(
      uid: uid,
      cardImage: imagePath?.path ?? '',
      name: manager.name,
      email: manager.email,
      team: manager.team,
      company: manager.company,
      phone: manager.phone,
      fax: manager.fax,
      profileImage: '',
      external: [],
      lastUpdate: '',
      createdAt: '',
    );
  }
}

// 추가 메서드
LoginType _getLoginType(User user) {
  late String loginProvider;
  if (user.providerData.isNotEmpty) {
    loginProvider = user.providerData.first.providerId;
  }

  switch (loginProvider) {
    case 'google.com':
      return LoginType.google;
    case 'kakao.com':
      return LoginType.kakao;

    default:
      return LoginType.email;
  }
}
