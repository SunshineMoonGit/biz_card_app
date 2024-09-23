import 'package:biz_card_app/config/app/app_enum.dart';
import 'package:biz_card_app/config/app/app_string.dart';
import 'package:biz_card_app/config/app/app_svg.dart';
import 'package:biz_card_app/features/data/models/user/my_user_info_model.dart';
import 'package:biz_card_app/features/presentation/providers/auth/auth_info_provider.dart';
import 'package:biz_card_app/features/presentation/providers/image/custom_image_provider.dart';
import 'package:biz_card_app/features/presentation/providers/setting/custom_setting_provider.dart';
import 'package:biz_card_app/features/presentation/providers/setting/theme_provider.dart';
import 'package:biz_card_app/features/presentation/views/setting/setting_select_screen.dart';
import 'package:biz_card_app/features/presentation/views/setting/setting_string_screen.dart';
import 'package:biz_card_app/shared/class/setting_items_manager/basic_setting_item_model.dart';
import 'package:biz_card_app/shared/class/setting_items_manager/select_setting_item_model.dart';
import 'package:biz_card_app/shared/class/setting_items_manager/string_setting_item_model.dart';
import 'package:biz_card_app/shared/provider/methods/app_method.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AppSetting {
  AppSetting(this.ref);

  final WidgetRef ref;

  // ALL
  late List<List<BasicSettingItemModel>> main = [
    authSetting(),
    customSettings(),
  ];

  late List<BasicSettingItemModel> profile = [
    ...profileDetailSettings(),
  ];

  List<BasicSettingItemModel> authSetting() {
    final MyUserInfoModel authInfo = ref.read(authInfoProvider);
    return [
      StringSettingItemModel(
        icon: AppSvg.getSvgPlatform(authInfo.loginType.name),
        title: AppString.aboutSignIn,
        description: AppString.nameDesc,
        settingType: SettingType.auth,
        onNavigate: (context, model) => context.push('location', extra: model),
        onSave: () => ref.read(customImageProvider),
        value: authInfo.loginType.name,
      ),
      StringSettingItemModel(
        icon: AppSvg.getSvgName(AppSvg.profile0),
        title: 'isPremium',
        description: AppString.nameDesc,
        settingType: SettingType.auth,
        onNavigate: (context, model) => context.push('location', extra: model),
        onSave: () {},
      ),
    ];
  }

  List<BasicSettingItemModel> profileDetailSettings() {
    final MyUserInfoModel myInfo = ref.read(authInfoProvider);

    return [
      StringSettingItemModel(
        title: AppString.name,
        description: AppString.nameDesc,
        value: myInfo.name,
        settingType: SettingType.auth,
        onNavigate: (context, model) => context.push(SettingStringScreen.route, extra: model),
        onSave: () {},
      ),
      StringSettingItemModel(
        title: AppString.company,
        description: AppString.nameDesc,
        value: myInfo.company,
        settingType: SettingType.auth,
        onNavigate: (context, model) => context.push(SettingStringScreen.route, extra: model),
        onSave: () {},
      ),
      StringSettingItemModel(
        title: AppString.team,
        description: AppString.nameDesc,
        value: myInfo.company,
        settingType: SettingType.auth,
        onNavigate: (context, model) => context.push(SettingStringScreen.route, extra: model),
        onSave: () {},
      ),
      StringSettingItemModel(
        title: AppString.phone,
        description: AppString.nameDesc,
        value: myInfo.company,
        settingType: SettingType.auth,
        onNavigate: (context, model) => context.push(SettingStringScreen.route, extra: model),
        onSave: () {},
      ),
      StringSettingItemModel(
        title: AppString.email,
        description: AppString.nameDesc,
        value: myInfo.email,
        settingType: SettingType.auth,
        onNavigate: (context, model) => context.push(SettingStringScreen.route, extra: model),
        onSave: () {},
      ),
      StringSettingItemModel(
        title: AppString.fax,
        description: AppString.nameDesc,
        value: myInfo.fax,
        settingType: SettingType.auth,
        onNavigate: (context, model) => context.push(SettingStringScreen.route, extra: model),
        onSave: () {},
      ),
    ];
  }

  List<BasicSettingItemModel> customSettings() {
    return [
      display,
      language,
    ];
  }

  SelectSettingItemModel? select(String title) {
    switch (title) {
      case AppString.display:
        return display;
      case AppString.language:
        return language;
    }
    return null;
  }

  SelectSettingItemModel get display => SelectSettingItemModel(
        icon: AppSvg.getSvgName(AppSvg.brightness),
        title: AppString.display,
        description: "display_setting_desc.",
        settingType: SettingType.display,
        onNavigate: (context, model) => context.push(SettingSelectScreen.route, extra: model.title),
        value: AppString.darkMode,
        options: [
          SettingOption(
            title: "dark_mode",
            value: ref.watch(themeProvider).type == ThemeType.dark,
            onTap: () => AppMethod(ref).theme.changeTheme(ThemeType.dark),
          ),
          SettingOption(
            title: "light_mode",
            value: ref.watch(themeProvider).type == ThemeType.light,
            onTap: () => AppMethod(ref).theme.changeTheme(ThemeType.light),
          ),
        ],
      );

  SelectSettingItemModel get language => SelectSettingItemModel(
        icon: AppSvg.getSvgName(AppSvg.language),
        title: AppString.language,
        description: "language_setting_desc.",
        settingType: SettingType.display,
        onNavigate: (context, model) => context.push(SettingSelectScreen.route, extra: model.title),
        value: AppString.en,
        options: [
          SettingOption(
            title: AppString.en,
            value: ref.watch(customSettingProvider).language == AppString.en,
            onTap: () => AppMethod(ref).theme.changeLanguage(AppString.en),
          ),
          SettingOption(
            title: AppString.ko,
            value: ref.watch(customSettingProvider).language == AppString.ko,
            onTap: () => AppMethod(ref).theme.changeLanguage(AppString.ko),
          ),
        ],
      );
}


  // SettingItemModel(
  //   title: "글꼴 크기 조정",
  //   description: "글꼴 크기를 조정합니다.",
  // ),
  // SettingItemModel(
  //   title: "애플리케이션 언어 선택",
  //   description: "언어를 선택합니다 (예: 한국어, 영어, 일본어 등).",
  // ),
  // SettingItemModel(
  //   title: "지역 설정",
  //   description: "시간대 및 날짜 형식을 설정합니다.",
  // ),
  // SettingItemModel(
  //   title: "사용자 프로필 관리",
  //   description: "이름, 이메일, 프로필 사진을 관리합니다.",
  // ),
  // SettingItemModel(
  //   title: "비밀번호 변경",
  //   description: "비밀번호를 변경합니다.",
  // ),
  // SettingItemModel(
  //   title: "로그아웃 옵션",
  //   description: "로그아웃합니다.",
  // ),
  // SettingItemModel(
  //   title: "푸시 알림 켜기/끄기",
  //   description: "푸시 알림을 설정합니다.",
  // ),
  // SettingItemModel(
  //   title: "알림 소리 및 진동 설정",
  //   description: "알림 소리 및 진동을 설정합니다.",
  // ),
  // SettingItemModel(
  //   title: "데이터 수집 동의 관리",
  //   description: "데이터 수집에 대한 동의를 관리합니다.",
  // ),
  // SettingItemModel(
  //   title: "위치 정보 사용 설정",
  //   description: "위치 정보 사용을 설정합니다.",
  // ),
  // SettingItemModel(
  //   title: "버전 정보",
  //   description: "앱의 버전 정보를 확인합니다.",
  // ),
  // SettingItemModel(
  //   title: "이용 약관 및 개인정보 처리방침 링크",
  //   description: "이용 약관 및 개인정보 처리방침을 확인합니다.",
  // ),