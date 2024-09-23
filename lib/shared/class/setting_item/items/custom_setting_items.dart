part of '../setting_item_model.dart';

/*
디스플레이
언어
*/

class CustomSettingItems {
  const CustomSettingItems(this.context, this.ref);

  final BuildContext context;
  final WidgetRef ref;

  List<SettingItemModel> get items {
    // 여기에 메인 설정 항목들을 구현합니다.
    return [
      SettingItemModel(
        title: AppString.lightMode,
        onTap: (_) => AppMethod(ref).theme.changeTheme(ThemeType.light),
        value: ref.watch(themeProvider).type == ThemeType.light,
        rowType: InputType.select,
      ),
      SettingItemModel(
        title: AppString.darkMode,
        onTap: (_) => AppMethod(ref).theme.changeTheme(ThemeType.dark),
        value: ref.watch(themeProvider).type == ThemeType.dark,
        rowType: InputType.select,
      ),
    ];
  }
}
