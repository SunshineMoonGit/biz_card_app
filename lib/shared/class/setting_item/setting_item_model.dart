import 'package:biz_card_app/config/app/app_enum.dart';
import 'package:biz_card_app/config/app/app_path.dart';
import 'package:biz_card_app/config/app/app_string.dart';
import 'package:biz_card_app/features/data/models/user/my_user_info_model.dart';
import 'package:biz_card_app/features/data/models/user/user_info_model.dart';
import 'package:biz_card_app/features/presentation/providers/auth/auth_info_provider.dart';
import 'package:biz_card_app/features/presentation/providers/setting/custom_setting_provider.dart';
import 'package:biz_card_app/features/presentation/providers/setting/theme_provider.dart';
import 'package:biz_card_app/features/presentation/views/setting/setting_edit_text_form_screen.dart';
import 'package:biz_card_app/shared/provider/methods/app_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

part './items/auth_setting_items.dart';
part './items/custom_setting_items.dart';
part './items/display_setting_items.dart';
part './items/language_setting_items.dart';
part './items/profile_detail_setting_items.dart';

class SettingItemModel {
  SettingItemModel({
    this.icon,
    this.iconHasColor = false,
    required this.title,
    required this.onTap,
    this.detail,
    this.rowType = InputType.string,
    this.value = false,
    this.onNavigate,
    this.onSave,
  });

  final String? icon;
  final bool iconHasColor;

  final String title;
  final Function(BuildContext, SettingItemModel)? onNavigate;
  final Function(String)? onSave;
  final void Function(SettingItemModel) onTap;
  final String? detail;

  final bool value;
  final InputType rowType;

  static List<SettingItemModel> settingTypeOfList({
    required SettingType type,
    required BuildContext context,
    required WidgetRef ref,
  }) {
    switch (type) {
      case SettingType.main:
      // return MainSettingItems(context, ref).items;
      case SettingType.auth:
        return AuthSettingItems(context, ref).items;
      case SettingType.profile:
        return ProfileSettingItems(context, ref).items;
      case SettingType.display:
        return DisplaySettingItems(context, ref).items;
      case SettingType.language:
        return LanguageSettingItems(context, ref).items;
      default:
        return [];
    }
  }
}

// 디스플레이 설정:

// 화면 밝기 조절
// 테마 선택 (어두운 모드/밝은 모드)
// 글꼴 크기 조정
// 언어 설정:

// 애플리케이션 언어 선택 (예: 한국어, 영어, 일본어 등)
// 지역 설정 (예: 시간대, 날짜 형식)
// 계정 설정:

// 사용자 프로필 관리 (이름, 이메일, 프로필 사진)
// 비밀번호 변경
// 로그아웃 옵션
// 알림 설정:

// 푸시 알림 켜기/끄기
// 알림 소리 및 진동 설정
// 개인정보 보호:

// 데이터 수집 동의 관리
// 위치 정보 사용 설정
// 앱 정보:

// 버전 정보
// 이용 약관 및 개인정보 처리방침 링크
// 기타 설정:

// 백업 및 복원 옵션
// 기본값으로 재설정