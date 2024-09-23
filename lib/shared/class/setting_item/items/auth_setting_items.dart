part of '../setting_item_model.dart';

class AuthSettingItems {
  final BuildContext context;
  final WidgetRef ref;

  AuthSettingItems(this.context, this.ref);

  List<SettingItemModel> get items {
    final MyUserInfoModel authInfo = ref.read(authInfoProvider);

    // 여기에 메인 설정 항목들을 구현합니다.
    return [
      SettingItemModel(
        title: AppString.aboutSignIn,
        onTap: (_) {},
        detail: authInfo.loginType.name,
        icon: authInfo.loginType.name,
        iconHasColor: true,
      ),
      SettingItemModel(
        title: 'Is Premium?',
        onTap: (_) {},
        detail: authInfo.userType.name,
        icon: 'profile_1',
      ),
    ];
  }
}
