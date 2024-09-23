part of '../setting_item_model.dart';

class DisplaySettingItems {
  final BuildContext context;
  final WidgetRef ref;

  DisplaySettingItems(this.context, this.ref);

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
